namespace VKR
{
    /// <summary>
    /// Содержит параметры для схемы базовой стабилизации
    /// </summary>
    public class BaseBias : TransistorBias
    {
        /// <summary>
        /// Сопротивление базы, Ом
        /// </summary>
        public double Rb
        {
            get
            {
                return (Vcc - Vbe) / Ib;
            }
        }

        /// <summary>
        /// Сопротивление коллектора, Ом
        /// </summary>
        public double Rc
        {
            get
            {
                return (Vcc - Vce) / Ic;
            }
        }

        /// <summary>
        /// Ток источника питания, мА
        /// </summary>
        public double Icc
        {
            get
            {
                return CalculateIc(hfeTyp, TcTyp) + Ib * 1000;
            }
        }

        /// <summary>
        /// Вычисляет коэффициент стабилизации для теплового тока
        /// </summary>
        /// <param name="hfe">Коэффициент усиления тока коллектора</param>
        /// <returns>Коэффициент стабилизации для теплового тока</returns>
        public override double SIcbo(double hfe)
        {
            return 1 + hfe;
        }

        /// <summary>
        /// Вычисляет коэффициент стабилизации для напряжения отсечки
        /// </summary>
        /// <param name="hfe">Коэффициент усиления тока коллектора</param>
        /// <returns>Коэффициент стабилизации для напряжения отсечки</returns>
        public override double SInternalVbe(double hfe)
        {
            return -hfe / (hie + 30000);
        }

        /// <summary>
        /// Вычисляет коэффициент стабилизации для коэффициента усиления тока коллектора
        /// </summary>
        /// <param name="hfe">Коэффициент усиления тока коллектора</param>
        /// <returns>Коэффициент стабилизации для усиления тока коллектора</returns>
        public override double Shfe(double hfe)
        {
            return (Vcc - InternalVbe) / (hie + 30000) + Icbo;
        }

        /// <summary>
        /// Вычисляет ток коллектора
        /// </summary>
        /// <param name="hfe">Коэффициент усиления тока коллектора</param>
        /// <param name="Tc">Температура транзистора, °C</param>
        /// <returns>Ток коллектора, мА</returns>
        public override double CalculateIc(double hfe, double Tc)
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