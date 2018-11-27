using System;

namespace VKR
{
    /// <summary>
    /// Содержит общие параметры для разных типов смещений транзисторов
    /// </summary>
    abstract public class TransistorBias
    {
        /// <summary>
        /// Номинальный ток коллектора, А
        /// </summary>
        public double Ic
        { get; set; }

        /// <summary>
        /// Напряжение питания, В
        /// </summary>
        public double Vcc
        { get; set; }

        /// <summary>
        /// Напряжение коллектор-эмиттер, В
        /// </summary>
        public double Vce
        { get; set; }

        /// <summary>
        /// Коэффициент усиления тока коллектора, минимальное значение
        /// </summary>
        public double hfeMin
        { get; set; }

        /// <summary>
        /// Коэффициент усиления тока коллектора, нормальное значение
        /// </summary>
        public double hfeTyp
        { get; set; }

        /// <summary>
        /// Коэффициент усиления тока коллектора, максимальное значение
        /// </summary>
        public double hfeMax
        { get; set; }

        /// <summary>
        /// Тепловой ток, А
        /// </summary>
        public double Icbo
        { get; set; }

        /// <summary>
        /// Температура транзистора, минимальное значение °C
        /// </summary>
        public double TcMin
        { get; set; }

        /// <summary>
        /// Температура транзистора, нормальное значение °C
        /// </summary>
        public double TcTyp
        {
            get
            {
                return 25;
            }
        }

        /// <summary>
        /// Температура транзистора, максимальное значение °C
        /// </summary>
        public double TcMax
        { get; set; }

        /// <summary>
        /// Напряжение между базой и эмиттером, В
        /// </summary>
        public double Vbe
        { get; set; }

        /// <summary>
        /// Скорость изменения коэффициента усиления при изменении температуры, %/°C
        /// </summary>
        public double dhfe
        { get; set; }

        /// <summary>
        /// Скорость изменения напряжения отсечки при изменении температуры, В/°C
        /// </summary>
        public double dVbe
        { get; set; }

        /// <summary>
        /// Скорость изменения теплового тока при изменении температуры, /10 °C
        /// </summary>
        public double dIcbo
        { get; set; }

        /// <summary>
        /// Ток базы, А
        /// </summary>
        public double Ib
        {
            get
            {
                return Ic / hfeTyp;
            }
        }

        /// <summary>
        /// Входное сопротивление, Ом
        /// </summary>
        public double hie
        {
            get
            {
                return hfeTyp / (40 * Ic);
            }
        }

        /// <summary>
        /// Напряжение отсечки, В
        /// </summary>
        public double InternalVbe
        {
            get
            {
                return Vbe - Ib * hie;
            }
        }

        /// <summary>
        /// Вычисляет коэффициент стабилизации для теплового тока
        /// </summary>
        /// <param name="hfe">Коэффициент усиления тока коллектора</param>
        /// <returns>Коэффициент стабилизации для теплового тока</returns>
        abstract public double SIcbo(double hfe);


        /// <summary>
        /// Вычисляет коэффициент стабилизации для напряжения отсечки
        /// </summary>
        /// <param name="hfe">Коэффициент усиления тока коллектора</param>
        /// <returns>Коэффициент стабилизации для напряжения отсечки</returns>
        abstract public double SInternalVbe(double hfe);

        /// <summary>
        /// Вычисляет коэффициент стабилизации для коэффициента усиления тока коллектора
        /// </summary>
        /// <param name="hfe">Коэффициент усиления тока коллектора</param>
        /// <returns>Коэффициент стабилизации для усиления тока коллектора</returns>
        abstract public double Shfe(double hfe);

        /// <summary>
        /// Вычисляет ток коллектора
        /// </summary>
        /// <param name="hfe">Коэффициент усиления тока коллектора</param>
        /// <param name="Tc">Температура транзистора, °C</param>
        /// <returns>Ток коллектора, мА</returns>
        abstract public double CalculateIc(double hfe, double Tc);

        /// <summary>
        /// Вычисляет изменение тока коллектора в зависимости от изменения
        /// теплового тока
        /// </summary>
        /// <param name="hfe">Коэффициент усиления тока коллектора</param>
        /// <param name="deltaTc">Изменение температуры транзистора, °C</param>
        /// <returns>Ток коллектора, мА</returns>
        public double DeltaIcIcbo(double hfe, double deltaTc)
        {
            double deltaIcbo = Icbo * Math.Pow(dIcbo, deltaTc / 10) - Icbo;
            return SIcbo(hfe) * deltaIcbo * 1000;
        }

        /// <summary>
        /// Вычисляет изменение тока коллектора в зависимости от изменения
        /// напряжения отсечки
        /// </summary>
        /// <param name="hfe">Коэффициент усиления тока коллектора</param>
        /// <param name="deltaTc">Изменение температуры транзистора, °C</param>
        /// <returns>Ток коллектора, мА</returns>
        public double DeltaIcInternalVbe(double hfe, double deltaTc)
        {
            double deltaInternalVbe = dVbe * deltaTc;
            return SInternalVbe(hfe) * deltaInternalVbe * 1000;
        }

        /// <summary>
        /// Вычисляет изменение тока коллектора в зависимости от изменения
        /// коэффициента усиления тока коллектора
        /// </summary>
        /// <param name="hfe">Коэффициент усиления тока коллектора</param>
        /// <param name="deltaTc">Изменение температуры транзистора, °C</param>
        /// <returns>Ток коллектора, мА</returns>
        public double DeltaIcHfe(double hfe, double deltaTc)
        {
            double deltahfe = hfe * (1 + dhfe / 100 * deltaTc) - hfe;
            return Shfe(hfe) * deltahfe * 1000;
        }
    }
}