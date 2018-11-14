using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace VKR
{
    public partial class VoltageFeedbackCurrentSourceForm : System.Web.UI.Page
    {
        VoltageFeedbackCurrentSource scheme = new VoltageFeedbackCurrentSource();

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void CalculateButton_Click(object sender, EventArgs e)
        {
            // Считывание полей
            scheme.Vcc = Convert.ToDouble(VccTextBox.Text);
            scheme.Ic = Convert.ToDouble(IcTextBox.Text) / 1000;
            scheme.Vce = Convert.ToDouble(VceTextBox.Text);
            scheme.hfeMin = Convert.ToDouble(hfeMinTextBox.Text);
            scheme.hfeTyp = Convert.ToDouble(hfeTypTextBox.Text);
            scheme.hfeMax = Convert.ToDouble(hfeMaxTextBox.Text);
            scheme.Icbo = Convert.ToDouble(IcboTextBox.Text) / 1000000;
            scheme.TcMin = Convert.ToDouble(TcMinTextBox.Text);
            scheme.TcMax = Convert.ToDouble(TcMaxTextBox.Text);
            scheme.Vbe = Convert.ToDouble(VbeTextBox.Text);
            scheme.dhfe = Convert.ToDouble(dhFETextBox.Text);
            scheme.dVbe = Convert.ToDouble(dVbeTextBox.Text) / 1000;
            scheme.dIcbo = Convert.ToDouble(dIcboTextBox.Text);
            scheme.Vrb2 = Convert.ToDouble(a1TextBox.Text) * scheme.Vce;
            scheme.Ib2 = Convert.ToDouble(a2TextBox.Text) * scheme.Ic;

            // Расчёт параметров
            double IcMin = scheme.CalculateIc(scheme.hfeMin, scheme.TcMin);
            double IcMax = scheme.CalculateIc(scheme.hfeMax, scheme.TcMax);
            double deltaIcIcbo = scheme.DeltaIcIcbo(scheme.hfeTyp, scheme.TcMax - scheme.TcTyp);
            double deltaIcInternalVbe = scheme.DeltaIcInternalVbe(scheme.hfeTyp, scheme.TcMax - scheme.TcTyp);
            double deltaIcHfe = scheme.DeltaIcHfe(scheme.hfeTyp, scheme.TcMax - scheme.TcTyp);

            RbTextBox.Text = scheme.Rb.ToString("0.");
            Rb1TextBox.Text = scheme.Rb1.ToString("0.");
            Rb2TextBox.Text = scheme.Rb2.ToString("0.");
            RcTextBox.Text = scheme.Rc.ToString("0.");
            Vrb2TextBox.Text = scheme.Vrb2.ToString();
            Irb2TextBox.Text = (scheme.Ib2 * 1000).ToString();
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
}