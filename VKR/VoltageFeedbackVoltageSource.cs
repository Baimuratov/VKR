using System;

namespace VKR
{
    /// <summary>
    /// Содержит параметры для смещения биполярного транзистора 
    /// с обратным напряжением с источником напряжения
    /// </summary>
    public class VoltageFeedbackVoltageSource : TransistorBias
    {
        /// <summary>
        /// Ток на втором базовом сопротивлении
        /// </summary>
        public double Ib2
        { get; set; }

        /// <summary>
        /// Напряжение на втором базовом сопротивлении, В
        /// </summary>
        public double Vrb2
        { get; set; }

        /// <summary>
        /// Первое сопротивление базы, Ом
        /// </summary>
        public double Rb1
        {
            get
            {
                return (Vce - (Ib2 * Rb2)) / (Ib + Ib2);
            }
        }

        /// <summary>
        /// Второе сопротивление базы, Ом
        /// </summary>
        public double Rb2
        {
            get
            {
                return Vbe / Ib2;
            }
        }

        /// <summary>
        /// Сопротивление коллектора, Ом
        /// </summary>
        public double Rc
        {
            get
            {
                return (Vcc - Vce) / (Ic + Ib + Ib2);
            }
        }

        /// <summary>
        /// Вычисляет коэффициент стабилизации для теплового тока
        /// </summary>
        /// <param name="hfe">Коэффициент усиления тока коллектора</param>
        /// <returns>Коэффициент стабилизации для теплового тока</returns>
        public override double SIcbo(double hfe)
        {
            double A = Rc / hfe + Rc + Rb1 / hfe + Rb1;
            double B = Rc / (Rb2 * hfe) + Rc / Rb2 + Rb1 / (Rb2 * hfe) + Rb1 / Rb2 + 1 / hfe + 1;
            double C = Rc + Rc / hfe + Rb1 / hfe + hie * (Rc / (Rb2 * hfe) + Rb1 / (Rb2 * hfe) + 1 / hfe);
            return (hie * B + A) / C;
        }

        /// <summary>
        /// Вычисляет коэффициент стабилизации для напряжения отсечки
        /// </summary>
        /// <param name="hfe">Коэффициент усиления тока коллектора</param>
        /// <returns>Коэффициент стабилизации для напряжения отсечки</returns>
        public override double SInternalVbe(double hfe)
        {
            double C = Rc + Rc / hfe + Rb1 / hfe + hie * (Rc / (Rb2 * hfe) + Rb1 / (Rb2 * hfe) + 1 / hfe);
            return (-Rc / Rb2 - Rb1 / Rb2 - 1) / C;
        }

        /// <summary>
        /// Вычисляет коэффициент стабилизации для коэффициента усиления тока коллектора
        /// </summary>
        /// <param name="hfe">Коэффициент усиления тока коллектора</param>
        /// <returns>Коэффициент стабилизации для усиления тока коллектора</returns>
        public override double Shfe(double hfe)
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
        /// <returns>Ток коллектора, мА</returns>
        public double CalculateIc(double hfe, double Tc)
        {
            double Ic = -1 * (-Rc / hfe * Icbo - Rc * Icbo + Rc / Rb2 * InternalVbe - Rc / (Rb2 * hfe) * hie * Icbo - Rc / Rb2 * hie * Icbo - Rb1 / hfe * Icbo - Rb1 * Icbo
                + Rb1 / Rb2 * InternalVbe - Rb1 / (Rb2 * hfe) * hie * Icbo - Rb1 / Rb2 * hie * Icbo + InternalVbe - 1 / hfe * hie * Icbo - hie * Icbo - Vcc)
                / (Rc + Rc / hfe + Rc / (Rb2 * hfe) * hie + Rb1 / hfe + Rb1 / (Rb2 * hfe) * hie + 1 / hfe * hie);
            if (Tc == TcTyp)
            {
                return Ic * 1000;
            }
            else
            {
                double deltaTc = Tc - TcTyp;
                return Ic * 1000 + DeltaIcIcbo(hfe, deltaTc) + DeltaIcInternalVbe(hfe, deltaTc) + DeltaIcHfe(hfe, deltaTc);
            }
        }
    }
}