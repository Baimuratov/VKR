using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace VKR
{
    public class VoltageFeedbackVoltageSource
    {
        /// <summary>
        /// Номинальный ток коллектора
        /// </summary>
        public double Ic
        { get; set; }

        /// <summary>
        /// Ток на втором базовом сопротивлении
        /// </summary>
        public double Ib2
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
        /// Напряжение на втором базовом сопротивлении
        /// </summary>
        public double Vrb2
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
        /// Сопротивление базы
        /// </summary>
        public double Rb
        {
            get
            {
                return (Vrb2 - Vbe) / Ib;
            }
        }

        /// <summary>
        /// Первое сопротивление базы
        /// </summary>
        public double Rb1
        {
            get
            {
                return (Vce - (Ib2 * Rb2)) / (Ib + Ib2);
            }
        }

        /// <summary>
        /// Второе сопротивление базы
        /// </summary>
        public double Rb2
        {
            get
            {
                return Vbe / Ib2;
            }
        }

        /// <summary>
        /// Сопротивление коллектора
        /// </summary>
        public double Rc
        {
            get
            {
                return (Vcc - Vce) / (Ic + Ib + Ib2);
            }
        }

        /// <summary>
        /// Коэффициент стабилизации для теплового тока
        /// </summary>
        /// <param name="hfe">Коэффициент усиления тока коллектора</param>
        /// <returns></returns>
        public double SIcbo(double hfe)
        {
            double A = Rc / hfe + Rc + Rb1 / hfe + Rb1;
            double B = Rc / (Rb2 * hfe) + Rc / Rb2 + Rb1 / (Rb2 * hfe) + Rb1 / Rb2 + 1 / hfe + 1;
            double C = Rc + Rc / hfe + Rb1 / hfe + hie * (Rc / (Rb2 * hfe) + Rb1 / (Rb2 * hfe) + 1 / hfe);
            return (hie * B + A) / C;
        }

        /// <summary>
        /// Коэффициент стабилизации для напряжения отсечки
        /// </summary>
        /// <param name="hfe">Коэффициент усиления тока коллектора</param>
        /// <returns></returns>
        public double SInternalVbe(double hfe)
        {
            double C = Rc + Rc / hfe + Rb1 / hfe + hie * (Rc / (Rb2 * hfe) + Rb1 / (Rb2 * hfe) + 1 / hfe);
            return (-Rc / Rb2 - Rb1 / Rb2 - 1) / C;
        }

        /// <summary>
        /// Коэффициент стабилизации для коэффициента усиления тока коллектора 
        /// </summary>
        /// <param name="hfe">Коэффициент усиления тока коллектора</param>
        /// <returns></returns>
        public double Shfe(double hfe)
        {
            double A = Rc / hfe + Rc + Rb1 / hfe + Rb1;
            double B = Rc / (Rb2 * hfe) + Rc / Rb2 + Rb1 / (Rb2 * hfe) + Rb1 / Rb2 + 1 / hfe + 1;
            double C = Rc + Rc / hfe + Rb1 / hfe + hie * (Rc / (Rb2 * hfe) + Rb1 / (Rb2 * hfe) + 1 / hfe);
            double D = Rc / Rb2 * InternalVbe + Rb1 / Rb2 * InternalVbe + InternalVbe;
            double E = -Rc / (Rb2 * Math.Pow(hfe, 2)) - Rb1 / (Rb2 * Math.Pow(hfe, 2)) - 1 / Math.Pow(hfe, 2);
            return (Icbo * (-Rc / Math.Pow(hfe, 2) - Rb1 / Math.Pow(hfe, 2)) + Icbo * hie * E) / C
                - (Icbo * A + Icbo * hie * B - D + Vcc) / Math.Pow(C, 2)
                * (-Rc / Math.Pow(hfe, 2) - Rb1 / Math.Pow(hfe, 2) + hie * E);
        }

        /// <summary>
        /// Вычисляет ток коллектора
        /// </summary>
        /// <param name="hfe">Коэффициент усиления тока коллектора</param>
        /// <param name="Tc">Температура транзистора</param>
        /// <returns></returns>
        public double CalculateIc(double hfe, double Tc)
        {
            double Ic = (-Rc / hfe * Icbo - Rc * Icbo + Rc / Rb2 * InternalVbe - Rc / (Rb2 * hfe) * hie * Icbo - Rc / Rb2 * hie * Icbo - Rb1 / hfe * Icbo - Rb1 * Icbo
                + Rb1 / Rb2 * InternalVbe - Rb1 / (Rb2 * hfe) * hie * Icbo - Rb1 / Rb2 * hie * Icbo + InternalVbe - 1 / hfe * hie * Icbo - hie * Icbo - Vcc)
                / (Rc + Rc / hfe + Rc / (Rb2 * hfe) * hie + Rb1 / hfe + Rb1 / (Rb2 * hfe) * hie + 1 / hfe * hie);
            if (Tc == TcTyp)
            {
                return Ic * 1000;
            }
            else
            {
                double deltaTc = Tc - TcTyp;
                double deltaIcbo = Icbo * Math.Pow(dIcbo, deltaTc / 10) - Icbo;
                double deltaInternalVbe = dVbe * deltaTc;
                double deltahfe = hfe * (1 + dhfe / 100 * deltaTc) - hfe;

                return (Ic + SIcbo(hfe) * deltaIcbo + SInternalVbe(hfe) * deltaInternalVbe + Shfe(hfe) * deltahfe) * 1000;
            }
        }
    }
}