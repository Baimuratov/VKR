using System;

namespace VKR
{
    /// <summary>
    /// Содержит параметры для смещения биполярного транзистора с обратным эмиттером
    /// </summary>
    public class EmitterFeedbackBias : TransistorBias
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
        {
            get
            {
                return InternalVbe + Re * (Ib + Ic);
            }
        }

        /// <summary>
        /// Первое сопротивление базы, Ом
        /// </summary>
        public double Rb1
        {
            get
            {
                return (Vcc - (Ib2 * Rb2)) / (Ib + Ib2);
            }
        }

        /// <summary>
        /// Второе сопротивление базы, Ом
        /// </summary>
        public double Rb2
        {
            get
            {
                return Vrb2 / Ib2;
            }
        }

        /// <summary>
        /// Сопротивление эмиттера, Ом
        /// </summary>
        public double Re
        {
            get
            {
                return (Vcc - Vce) / (Ic * (1 + 1 / hfeTyp));
            }
        }

        /// <summary>
        /// Ток источника питания
        /// </summary>
        public double Icc
        {
            get
            {
                return CalculateIc(hfeTyp, TcTyp) + (Ib + Ib2) * 1000;
            }
        }

        /// <summary>
        /// Вычисляет коэффициент стабилизации для теплового тока
        /// </summary>
        /// <param name="hfe">Коэффициент усиления тока коллектора</param>
        /// <returns>Коэффициент стабилизации для теплового тока</returns>
        public override double SIcbo(double hfe)
        {
            double A = Rb1 / (Rb2 * hfe) + Rb1 / Rb2 + 1 / hfe + 1;
            double B = Rb1 / Rb2 * Re / hfe + Rb1 / Rb2 * Re + Re / hfe + Re + Rb1 / hfe + Rb1;
            double C = hie * (1 / hfe + Rb1 / (Rb2 * hfe)) + Re / hfe + Re + Rb1 / Rb2 * Re / hfe + Rb1 / Rb2 * Re + Rb1 / hfe;
            return (hie * A + B) / C;
        }

        /// <summary>
        /// Вычисляет коэффициент стабилизации для напряжения отсечки
        /// </summary>
        /// <param name="hfe">Коэффициент усиления тока коллектора</param>
        /// <returns>Коэффициент стабилизации для напряжения отсечки</returns>
        public override double SInternalVbe(double hfe)
        {
            double C = hie * (1 / hfe + Rb1 / (Rb2 * hfe)) + Re / hfe + Re + Rb1 / Rb2 * Re / hfe + Rb1 / Rb2 * Re + Rb1 / hfe;
            return (-1 - Rb1 / Rb2) / C;
        }

        /// <summary>
        /// Вычисляет коэффициент стабилизации для коэффициента усиления тока коллектора
        /// </summary>
        /// <param name="hfe">Коэффициент усиления тока коллектора</param>
        /// <returns>Коэффициент стабилизации для усиления тока коллектора</returns>
        public override double Shfe(double hfe)
        {
            double A = Rb1 / (Rb2 * hfe) + Rb1 / Rb2 + 1 / hfe + 1;
            double B = Rb1 / Rb2 * Re / hfe + Rb1 / Rb2 * Re + Re / hfe + Re + Rb1 / hfe + Rb1;
            double C = hie * (1 / hfe + Rb1 / (Rb2 * hfe)) + Re / hfe + Re + Rb1 / Rb2 * Re / hfe + Rb1 / Rb2 * Re + Rb1 / hfe;
            double D = InternalVbe + Rb1 / Rb2 * InternalVbe - Vcc;
            double E = -Re / Math.Pow(hfe, 2) - Rb1 / Rb2 * Re / Math.Pow(hfe, 2) - Rb1 / Math.Pow(hfe, 2);
            return (Icbo * E + hie * Icbo * (-1 / Math.Pow(hfe, 2) - Rb1 / (Rb2 * Math.Pow(hfe, 2)))) / C - 
                (Icbo * B + hie * Icbo * A - D) / Math.Pow(C, 2) * 
                (hie * (-1 / Math.Pow(hfe, 2) - Rb1 / (Rb2 * Math.Pow(hfe, 2))) + E);
        }

        /// <summary>
        /// Вычисляет ток коллектора
        /// </summary>
        /// <param name="hfe">Коэффициент усиления тока коллектора</param>
        /// <param name="Tc">Температура транзистора</param>
        /// <returns>Ток коллектора, мА</returns>
        public double CalculateIc(double hfe, double Tc)
        {
            double Ic = -1* (InternalVbe - 1 / hfe * hie * Icbo - hie * Icbo - Re / hfe * Icbo - Re * Icbo + Rb1 / Rb2 * InternalVbe - Rb1 / (Rb2 * hfe) * hie * Icbo - Rb1 / Rb2
                * hie * Icbo - Rb1 / Rb2 * Re / hfe * Icbo - Rb1 / Rb2 * Re * Icbo - Rb1 / hfe * Icbo - Rb1 * Icbo - Vcc)
                / (1 / hfe * hie + Re / hfe + Re + Rb1 / (Rb2 * hfe) * hie + Rb1 / Rb2 * Re / hfe + Rb1 / Rb2 * Re + Rb1 / hfe);
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