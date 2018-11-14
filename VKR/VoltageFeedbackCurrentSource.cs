using System;

namespace VKR
{
    /// <summary>
    /// Содержит параметры для смещения биполярного транзистора 
    /// с обратным напряжением с источником постоянного тока
    /// </summary>
    public class VoltageFeedbackCurrentSource : TransistorBias
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
        /// Сопротивление базы, Ом
        /// </summary>
        public double Rb
        {
            get
            {
                return (Vrb2 - Vbe) / Ib;
            }
        }

        /// <summary>
        /// Первое сопротивление базы, Ом
        /// </summary>
        public double Rb1
        {
            get
            {
                return (Vce - Vrb2) / (Ib + Ib2);
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
            return (1 + hfe) - (Rb2 * hfe * Rc * (1 + hfe)) / ((Rb1 + Rb2 + Rc) * (Rb + hie) + Rb2 * (hfe * Rc + Rc + Rb1));
        }

        /// <summary>
        /// Вычисляет коэффициент стабилизации для напряжения отсечки
        /// </summary>
        /// <param name="hfe">Коэффициент усиления тока коллектора</param>
        /// <returns>Коэффициент стабилизации для напряжения отсечки</returns>
        public override double SInternalVbe(double hfe)
        {
            double A = Rb1 + Rb2 + Rc;
            return (-hfe * A) / (A * (Rb + hie) + Rb2 * (hfe * Rc + Rc + Rb1));
        }

        /// <summary>
        /// Вычисляет коэффициент стабилизации для коэффициента усиления тока коллектора
        /// </summary>
        /// <param name="hfe">Коэффициент усиления тока коллектора</param>
        /// <returns>Коэффициент стабилизации для усиления тока коллектора</returns>
        public override double Shfe(double hfe)
        {
            double B = InternalVbe * (Rb1 + Rb2 + Rc);
            double D = (Rb + hie) * (Rb1 + Rb2 + Rc) + Rb2 * (hfe * Rc + Rc + Rb1);
            return (hfe * (Rb2 * Rc * ((-Rb2 * Vcc + B) + Rb2 * Rc * Icbo * (1 + hfe)))) / Math.Pow(D, 2)
                - ((B + Rb2 * (Rc * Icbo * (1 + hfe) - Vcc + hfe * Rc * Icbo)) / D) + Icbo;
        }

        /// <summary>
        /// Вычисляет ток коллектора
        /// </summary>
        /// <param name="hfe">Коэффициент усиления тока коллектора</param>
        /// <param name="Tc">Температура транзистора</param>
        /// <returns>Ток коллектора, мА</returns>
        public double CalculateIc(double hfe, double Tc)
        {
            double Ic = hfe * ((-InternalVbe * (Rb1 + Rb2 + Rc) - Rb2 * (Rc * Icbo * (1 + hfe) - Vcc)) 
                / ((Rb + hie) * (Rb1 + Rb2 + Rc) + Rb2 * (hfe * Rc + Rc + Rb1))) + Icbo * (1 + hfe);
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