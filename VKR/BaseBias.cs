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

        public double hfeMin
        { get; set; }

        public double hfeTyp
        { get; set; }

        public double hfeMax
        { get; set; }

        public double Icbo
        { get; set; }

        public double TcMin
        { get; set; }

        public double TcTyp
        {
            get
            {
                return 25;
            }
        }

        public double TcMax
        { get; set; }

        public double Vbe
        { get; set; }

        public double dhfe
        { get; set; }

        public double dVbe
        { get; set; }

        public double dIcbo
        { get; set; }

        public double Ib
        {
            get
            {
                return Ic / hfeTyp;
            }
        }

        public double hie
        {
            get
            {
                return hfeTyp / (40 * Ic);
            }
        }

        public double InternalVbe
        {
            get
            {
                return Vbe - Ib * hie;
            }
        }

        public double Rc
        {
            get
            {
                return (Vcc - Vce) / Ic;
            }
        }

        public double Rb
        {
            get
            {
                return (Vcc - Vbe) / Ib;
            }
        }

        public double SIcbo(double hfe)
        {
            return 1 + hfe;
        }

        public double SInternalVbe(double hfe)
        {
            return -hfe / (hie + 30000);
        }

        public double Shfe(double hfe)
        {
            return (Vcc - InternalVbe) / (hie + 30000) + Icbo;
        }

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