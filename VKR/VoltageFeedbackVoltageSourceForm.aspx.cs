using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace VKR
{
    public partial class VoltageFeedbackVoltageSourceForm : System.Web.UI.Page
    {
        VoltageFeedbackVoltageSource scheme = new VoltageFeedbackVoltageSource();

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void CalculateButton_Click(object sender, EventArgs e)
        {
            if (IsValid)
            {
                // Расчёт параметров
                double IcMin = scheme.CalculateIc(scheme.hfeMin, scheme.TcMin);
                double IcMax = scheme.CalculateIc(scheme.hfeMax, scheme.TcMax);
                double deltaIcIcbo = scheme.DeltaIcIcbo(scheme.hfeTyp, scheme.TcMax - scheme.TcTyp);
                double deltaIcInternalVbe = scheme.DeltaIcInternalVbe(scheme.hfeTyp, scheme.TcMax - scheme.TcTyp);
                double deltaIcHfe = scheme.DeltaIcHfe(scheme.hfeTyp, scheme.TcMax - scheme.TcTyp);

                Rb1TextBox.Text = scheme.Rb1.ToString("0.");
                Rb2TextBox.Text = scheme.Rb2.ToString("0.");
                RcTextBox.Text = scheme.Rc.ToString("0.");
                Irb2TextBox.Text = (scheme.Ib2 * 1000).ToString("0.000");
                IccTextBox.Text = scheme.Icc.ToString("0.00");

                IcTable.Rows[0].Cells[1].Text = scheme.hfeMin.ToString();
                IcTable.Rows[0].Cells[2].Text = scheme.hfeTyp.ToString();
                IcTable.Rows[0].Cells[3].Text = scheme.hfeMax.ToString();
                IcTable.Rows[1].Cells[0].Text = scheme.TcMin.ToString();
                IcTable.Rows[2].Cells[0].Text = scheme.TcTyp.ToString();
                IcTable.Rows[3].Cells[0].Text = scheme.TcMax.ToString();

                IcTable.Rows[1].Cells[1].Text = IcMin.ToString("0.00");
                IcTable.Rows[1].Cells[2].Text = scheme.CalculateIc(scheme.hfeTyp, scheme.TcMin).ToString("0.00");
                IcTable.Rows[1].Cells[3].Text = scheme.CalculateIc(scheme.hfeMax, scheme.TcMin).ToString("0.00");
                IcTable.Rows[2].Cells[1].Text = scheme.CalculateIc(scheme.hfeMin, scheme.TcTyp).ToString("0.00");
                IcTable.Rows[2].Cells[2].Text = scheme.CalculateIc(scheme.hfeTyp, scheme.TcTyp).ToString("0.00");
                IcTable.Rows[2].Cells[3].Text = scheme.CalculateIc(scheme.hfeMax, scheme.TcTyp).ToString("0.00");
                IcTable.Rows[3].Cells[1].Text = scheme.CalculateIc(scheme.hfeMin, scheme.TcMax).ToString("0.00");
                IcTable.Rows[3].Cells[2].Text = scheme.CalculateIc(scheme.hfeTyp, scheme.TcMax).ToString("0.00");
                IcTable.Rows[3].Cells[3].Text = IcMax.ToString("0.00");

                IcMaxMinTextBox.Text = (IcMax / IcMin).ToString("0.00");

                STable.Rows[1].Cells[1].Text = scheme.SIcbo(scheme.hfeTyp).ToString("0.00E+00");
                STable.Rows[2].Cells[1].Text = scheme.SInternalVbe(scheme.hfeTyp).ToString("0.00E+00");
                STable.Rows[3].Cells[1].Text = scheme.Shfe(scheme.hfeTyp).ToString("0.00E+00");
                STable.Rows[1].Cells[2].Text = deltaIcIcbo.ToString("0.000");
                STable.Rows[2].Cells[2].Text = deltaIcInternalVbe.ToString("0.000");
                STable.Rows[3].Cells[2].Text = deltaIcHfe.ToString("0.000");
                STable.Rows[4].Cells[2].Text = (deltaIcIcbo + deltaIcInternalVbe + deltaIcHfe).ToString("0.000");
            }
        }

        protected void VccValidator_ServerValidate(object source, ServerValidateEventArgs args)
        {
            double value;
            try
            {
                value = Convert.ToDouble(args.Value);
                if (args.IsValid = (value > 0 && value <= 1000))
                {
                    scheme.Vcc = value;
                }
            }
            catch (Exception)
            {
                args.IsValid = false;
            }
        }

        protected void VceValidator_ServerValidate(object source, ServerValidateEventArgs args)
        {
            double value;
            try
            {
                value = Convert.ToDouble(args.Value);
                if (value <= 0 || value > 1000)
                {
                    args.IsValid = false;
                }
                else
                {
                    try
                    {
                        double Vcc = Convert.ToDouble(VccTextBox.Text);
                        if (args.IsValid = (value < Vcc))
                        {
                            scheme.Vce = value;
                        }
                    }
                    catch (Exception)
                    {
                        // Если значение в поле VccTextBox некорректное,
                        // то величина Vcc для сравнения отсутствует и нельзя определить корректность Vce.
                        // В этом случае сообщение об ошибке для Vce не выводится,
                        // но его присваивание свойству схемы не осуществляется
                        args.IsValid = true;
                    }
                }
            }
            catch (Exception)
            {
                args.IsValid = false;
            }
        }

        protected void hfeMinValidator_ServerValidate(object source, ServerValidateEventArgs args)
        {
            double value;
            try
            {
                value = Convert.ToDouble(args.Value);
                if (value < 1 || value > 10000)
                {
                    args.IsValid = false;
                }
                else
                {
                    try
                    {
                        double hfeTyp = Convert.ToDouble(hfeTypTextBox.Text);
                        if (args.IsValid = (value < hfeTyp))
                        {
                            scheme.hfeMin = value;
                        }
                    }
                    catch (Exception)
                    {
                        args.IsValid = true;
                    }
                }
            }
            catch (Exception)
            {
                args.IsValid = false;
            }
        }

        protected void hfeTypValidator_ServerValidate(object source, ServerValidateEventArgs args)
        {
            double value;
            try
            {
                value = Convert.ToDouble(args.Value);
                if (value < 1 || value > 10000)
                {
                    args.IsValid = false;
                }
                else
                {
                    try
                    {
                        double hfeMin = Convert.ToDouble(hfeMinTextBox.Text);
                        double hfeMax = Convert.ToDouble(hfeMaxTextBox.Text);
                        if (args.IsValid = (value > hfeMin && value < hfeMax))
                        {
                            scheme.hfeTyp = value;
                        }
                    }
                    catch (Exception)
                    {
                        args.IsValid = true;
                    }
                }
            }
            catch (Exception)
            {
                args.IsValid = false;
            }
        }

        protected void hfeMaxValidator_ServerValidate(object source, ServerValidateEventArgs args)
        {
            double value;
            try
            {
                value = Convert.ToDouble(args.Value);
                if (value < 1 || value > 10000)
                {
                    args.IsValid = false;
                }
                else
                {
                    try
                    {
                        double hfeTyp = Convert.ToDouble(hfeTypTextBox.Text);
                        if (args.IsValid = (value > hfeTyp))
                        {
                            scheme.hfeMax = value;
                        }
                    }
                    catch (Exception)
                    {
                        args.IsValid = true;
                    }
                }
            }
            catch (Exception)
            {
                args.IsValid = false;
            }
        }

        protected void IcboValidator_ServerValidate(object source, ServerValidateEventArgs args)
        {
            double value;
            try
            {
                value = Convert.ToDouble(args.Value);
                if (args.IsValid = (value > 0 && value <= 1000000))
                {
                    // Разделить на 1000000, чтобы перевести мкА в А
                    scheme.Icbo = value / 1000000;
                }
            }
            catch (Exception)
            {
                args.IsValid = false;
            }
        }

        protected void TcMinValidator_ServerValidate(object source, ServerValidateEventArgs args)
        {
            double value;
            try
            {
                value = Convert.ToDouble(args.Value);
                if (value < -273 || value > 200)
                {
                    args.IsValid = false;
                }
                else
                {
                    try
                    {
                        double TcTyp = Convert.ToDouble(TcTypTextBox.Text);
                        if (args.IsValid = (value < TcTyp))
                        {
                            scheme.TcMin = value;
                        }
                    }
                    catch (Exception)
                    {
                        args.IsValid = true;
                    }
                }
            }
            catch (Exception)
            {
                args.IsValid = false;
            }
        }

        protected void TcMaxValidator_ServerValidate(object source, ServerValidateEventArgs args)
        {
            double value;
            try
            {
                value = Convert.ToDouble(args.Value);
                if (value < -273 || value > 200)
                {
                    args.IsValid = false;
                }
                else
                {
                    try
                    {
                        double TcTyp = Convert.ToDouble(TcTypTextBox.Text);
                        if (args.IsValid = (value > TcTyp))
                        {
                            scheme.TcMax = value;
                        }
                    }
                    catch (Exception)
                    {
                        args.IsValid = true;
                    }
                }
            }
            catch (Exception)
            {
                args.IsValid = false;
            }
        }

        protected void VbeValidator_ServerValidate(object source, ServerValidateEventArgs args)
        {
            double value;
            try
            {
                value = Convert.ToDouble(args.Value);
                if (args.IsValid = (value > 0 && value <= 5))
                {
                    scheme.Vbe = value;
                }
            }
            catch (Exception)
            {
                args.IsValid = false;
            }
        }

        protected void dhfeValidator_ServerValidate(object source, ServerValidateEventArgs args)
        {
            double value;
            try
            {
                value = Convert.ToDouble(args.Value);
                if (args.IsValid = (value >= -1000 && value <= 1000))
                {
                    scheme.dhfe = value;
                }
            }
            catch (Exception)
            {
                args.IsValid = false;
            }
        }

        protected void dVbeValidator_ServerValidate(object source, ServerValidateEventArgs args)
        {
            double value;
            try
            {
                value = Convert.ToDouble(args.Value);
                if (args.IsValid = (value >= -10000 && value <= 10000))
                {
                    // Разделить на 1000, чтобы изменить мВ на В
                    scheme.dVbe = value / 1000;
                }
            }
            catch (Exception)
            {
                args.IsValid = false;
            }
        }

        protected void dIcboValidator_ServerValidate(object source, ServerValidateEventArgs args)
        {
            double value;
            try
            {
                value = Convert.ToDouble(args.Value);
                if (args.IsValid = (value > 0 && value <= 500))
                {
                    scheme.dIcbo = value;
                }
            }
            catch (Exception)
            {
                args.IsValid = false;
            }
        }

        protected void IcValidator_ServerValidate(object source, ServerValidateEventArgs args)
        {
            double value;
            try
            {
                value = Convert.ToDouble(args.Value);
                if (args.IsValid = (value > 0 && value <= 5000))
                {
                    // Разделить на 1000, чтобы перевести мА в А
                    scheme.Ic = value / 1000;
                }
            }
            catch (Exception)
            {
                args.IsValid = false;
            }
        }

        protected void a2Validator_ServerValidate(object source, ServerValidateEventArgs args)
        {
            double value;
            try
            {
                value = Convert.ToDouble(args.Value);
                if (value <= 0 || value > 1)
                {
                    args.IsValid = false;
                }
                else
                {
                    try
                    {
                        double Ic = Convert.ToDouble(IcTextBox.Text);
                        scheme.Ib2 = value * Ic / 1000;
                    }
                    catch (Exception)
                    {
                        ;
                    }
                    finally
                    {
                        args.IsValid = true;
                    }
                }
            }
            catch (Exception)
            {
                args.IsValid = false;
            }
        }
    }
}