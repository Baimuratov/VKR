using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace VKR
{
    public class BaseBias
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
        /// Сопротивление коллектора
        /// </summary>
        public double Rc
        {
            get
            {
                return (Vcc - Vce) / Ic;
            }
        }

        /// <summary>
        /// Сопротивление базы
        /// </summary>
        public double Rb
        {
            get
            {
                return (Vcc - Vbe) / Ib;
            }
        }

        /// <summary>
        /// Коэффициент стабилизации для теплового тока
        /// </summary>
        /// <param name="hfe">Коэффициент усиления тока коллектора</param>
        /// <returns></returns>
        public double SIcbo(double hfe)
        {
            return 1 + hfe;
        }

        /// <summary>
        /// Коэффициент стабилизации для напряжения отсечки
        /// </summary>
        /// <param name="hfe">Коэффициент усиления тока коллектора</param>
        /// <returns></returns>
        public double SInternalVbe(double hfe)
        {
            return -hfe / (hie + 30000);
        }

        /// <summary>
        /// Коэффициент стабилизации для коэффициента усиления тока коллектора 
        /// </summary>
        /// <param name="hfe">Коэффициент усиления тока коллектора</param>
        /// <returns></returns>
        public double Shfe(double hfe)
        {
            return (Vcc - InternalVbe) / (hie + 30000) + Icbo;
        }

        /// <summary>
        /// Вычисляет ток коллектора
        /// </summary>
        /// <param name="hfe">Коэффициент усиления тока коллектора</param>
        /// <param name="Tc">Температура транзистора</param>
        /// <returns></returns>
        public double CalculateIc(double hfe, double Tc)
        {
            double Ic = hfe * (Vcc - InternalVbe) / (hie + Rb) + Icbo * (1 + hfe);
            if (Tc == TcTyp)
            {
                return Ic*1000;
            }
            else
            {
                double deltaTc = Tc - TcTyp;
                double deltaIcbo = Icbo * Math.Pow(dIcbo, deltaTc / 10) - Icbo;
                double deltaInternalVbe = dVbe * deltaTc;
                double deltahfe = hfe * (1 + dhfe / 100 * deltaTc) - hfe;

                return (Ic + SIcbo(hfe) * deltaIcbo + SInternalVbe(hfe) * deltaInternalVbe + Shfe(hfe) * deltahfe)*1000;
            }
        }
    }
}