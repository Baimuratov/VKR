using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace VKR
{
    /// <summary>
    /// Содержит параметры для смещения биполярного транзистора с общей базой
    /// </summary>
    public class BaseBias : TransistorBias
    {
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
        /// Коэффициент стабилизации для теплового тока
        /// </summary>
        /// <param name="hfe">Коэффициент усиления тока коллектора</param>
        /// <returns></returns>
        public override double SIcbo(double hfe)
        {
            return 1 + hfe;
        }

        /// <summary>
        /// Коэффициент стабилизации для напряжения отсечки
        /// </summary>
        /// <param name="hfe">Коэффициент усиления тока коллектора</param>
        /// <returns></returns>
        public override double SInternalVbe(double hfe)
        {
            return -hfe / (hie + 30000);
        }

        /// <summary>
        /// Коэффициент стабилизации для коэффициента усиления тока коллектора 
        /// </summary>
        /// <param name="hfe">Коэффициент усиления тока коллектора</param>
        /// <returns></returns>
        public override double Shfe(double hfe)
        {
            return (Vcc - InternalVbe) / (hie + 30000) + Icbo;
        }

        /// <summary>
        /// Вычисляет ток коллектора
        /// </summary>
        /// <param name="hfe">Коэффициент усиления тока коллектора</param>
        /// <param name="Tc">Температура транзистора</param>
        /// <returns>Ток коллектора, мА</returns>
        public double CalculateIc(double hfe, double Tc)
        {
            double Ic = hfe * (Vcc - InternalVbe) / (hie + Rb) + Icbo * (1 + hfe);
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