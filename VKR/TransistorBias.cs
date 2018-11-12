using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace VKR
{
    abstract public class TransistorBias
    {
        /// <summary>
        /// Номинальный ток коллектора
        /// </summary>
        public double Ic
        { get; set; }

        /// <summary>
        /// Напряжение питания
        /// </summary>
        public double Vcc
        { get; set; }

        /// <summary>
        /// Напряжение коллектор-эмиттер
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
        /// Тепловой ток
        /// </summary>
        public double Icbo
        { get; set; }

        /// <summary>
        /// Температура транзистора, минимальное значение
        /// </summary>
        public double TcMin
        { get; set; }

        /// <summary>
        /// Температура транзистора, нормальное значение
        /// </summary>
        public double TcTyp
        {
            get
            {
                return 25;
            }
        }

        /// <summary>
        /// Температура транзистора, максимальное значение
        /// </summary>
        public double TcMax
        { get; set; }

        /// <summary>
        /// Напряжение между базой и эмиттером
        /// </summary>
        public double Vbe
        { get; set; }

        /// <summary>
        /// Скорость изменения коэффициента усиления при изменении температуры, %/C
        /// </summary>
        public double dhfe
        { get; set; }

        /// <summary>
        /// Скорость изменения напряжения отсечки при изменении температуры, V/C
        /// </summary>
        public double dVbe
        { get; set; }

        /// <summary>
        /// Скорость изменения теплового тока при изменении температуры, /10 C
        /// </summary>
        public double dIcbo
        { get; set; }

        /// <summary>
        /// Ток базы
        /// </summary>
        public double Ib
        {
            get
            {
                return Ic / hfeTyp;
            }
        }

        /// <summary>
        /// Входное сопротивление
        /// </summary>
        public double hie
        {
            get
            {
                return hfeTyp / (40 * Ic);
            }
        }

        /// <summary>
        /// Напряжение отсечки
        /// </summary>
        public double InternalVbe
        {
            get
            {
                return Vbe - Ib * hie;
            }
        }

        /// <summary>
        /// Коэффициент стабилизации для теплового тока
        /// </summary>
        /// <param name="hfe">Коэффициент усиления тока коллектора</param>
        /// <returns></returns>
        abstract public double SIcbo(double hfe);


        /// <summary>
        /// Коэффициент стабилизации для напряжения отсечки
        /// </summary>
        /// <param name="hfe">Коэффициент усиления тока коллектора</param>
        /// <returns></returns>
        abstract public double SInternalVbe(double hfe);

        /// <summary>
        /// Коэффициент стабилизации для коэффициента усиления тока коллектора 
        /// </summary>
        /// <param name="hfe">Коэффициент усиления тока коллектора</param>
        /// <returns></returns>
        abstract public double Shfe(double hfe);



        /// <summary>
        /// Вычисляет изменение тока коллектора в зависимости от изменения
        /// теплового тока
        /// </summary>
        /// <param name="hfe">Коэффициент усиления тока коллектора</param>
        /// <param name="deltaTc">Изменение температуры транзистора</param>
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
        /// <param name="deltaTc">Изменение температуры транзистора</param>
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
        /// <param name="deltaTc">Изменение температуры транзистора</param>
        /// <returns>Ток коллектора, мА</returns>
        public double DeltaIcHfe(double hfe, double deltaTc)
        {
            double deltahfe = hfe * (1 + dhfe / 100 * deltaTc) - hfe;
            return Shfe(hfe) * deltahfe * 1000;
        }
    }
}