using System;

namespace VKR
{
    /// <summary>
    /// Содержит параметры для смещения биполярного транзистора с обратным коллектором
    /// </summary>
    public class VoltageFeedbackBias : TransistorBias
    {
        /// <summary>
        /// Сопротивление базы, Ом
        /// </summary>
        public double Rb
        {
            get
            {
                return (Vce - Vbe) / Ib;
            }
        }

        /// <summary>
        /// Сопротивление коллектора, Ом
        /// </summary>
        public double Rc
        {
            get
            {
                return (Vcc - Vce) / (Ic + Ib);
            }
        }

        /// <summary>
        /// Вычисляет коэффициент стабилизации для теплового тока
        /// </summary>
        /// <param name="hfe">Коэффициент усиления тока коллектора</param>
        /// <returns>Коэффициент стабилизации для теплового тока</returns>
        public override double SIcbo(double hfe)
        {
            return ((1 + hfe) * (hie + Rb + Rc)) / (hie + Rb + Rc * (1 + hfe));
        }

        /// <summary>
        /// Вычисляет коэффициент стабилизации для напряжения отсечки
        /// </summary>
        /// <param name="hfe">Коэффициент усиления тока коллектора</param>
        /// <returns>Коэффициент стабилизации для напряжения отсечки</returns>
        public override double SInternalVbe(double hfe)
        {
            return -hfe / (hie + Rb + Rc * (1 + hfe));
        }

        /// <summary>
        /// Вычисляет коэффициент стабилизации для коэффициента усиления тока коллектора
        /// </summary>
        /// <param name="hfe">Коэффициент усиления тока коллектора</param>
        /// <returns>Коэффициент стабилизации для усиления тока коллектора</returns>
        public override double Shfe(double hfe)
        {
            return (Vcc - InternalVbe + Icbo * (hie + Rb + Rc)) / (hfe * Rc + hie + Rb + Rc) - (hfe * Rc * (Vcc - InternalVbe + Icbo * (hie + Rb + Rc)) + Icbo * (hie + Rb + Rc)) / Math.Pow(hfe * Rc + hie + Rb + Rc, 2);
        }

        /// <summary>
        /// Вычисляет ток коллектора
        /// </summary>
        /// <param name="hfe">Коэффициент усиления тока коллектора</param>
        /// <param name="Tc">Температура транзистора</param>
        /// <returns>Ток коллектора, мА</returns>
        public double CalculateIc(double hfe, double Tc)
        {
            double Ic = (hfe * (Vcc - InternalVbe) + Icbo * (1 + hfe) * (hie + Rb + Rc)) / (hie + Rb + Rc * (1 + hfe));
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