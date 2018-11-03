using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace VKR
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        BaseBias scheme = new BaseBias();

        protected void Page_Load(object sender, EventArgs e)
        {
            scheme.Vcc = 2.7;
            scheme.Ic = 0.005;
            scheme.Vce = 2;

            scheme.hfeMin = 50;
            scheme.hfeTyp = 80;
            scheme.hfeMax = 150;
            scheme.Icbo = 0.0000001;
            scheme.TcMin = -25;
            scheme.TcMax = 65;

            scheme.Vbe = 0.78;
            scheme.dhfe = 0.5;
            scheme.dVbe = -0.002;
            scheme.dIcbo = 2;

            VccTextBox.Text = scheme.Vcc.ToString("0.00");
            IcTextBox.Text = Convert.ToString(scheme.Ic * 1000);
            VceTextBox.Text = scheme.Vce.ToString("0.00");
            hfeMinTextBox.Text = scheme.hfeMin.ToString();
            hfeTypTextBox.Text = scheme.hfeTyp.ToString();
            hfeMaxTextBox.Text = scheme.hfeMax.ToString();
            IcboTextBox.Text = Convert.ToString(scheme.Icbo * 1000000);
            TcMinTextBox.Text = scheme.TcMin.ToString();
            TcTypTextBox.Text = scheme.TcTyp.ToString();
            TcMaxTextBox.Text = scheme.TcMax.ToString();
            VbeTextBox.Text = scheme.Vbe.ToString();
            dhFETextBox.Text = scheme.dhfe.ToString();
            dVbeTextBox.Text = Convert.ToString(scheme.dVbe * 1000);
            dIcboTextBox.Text = scheme.dIcbo.ToString();
        }

        protected void CalculateButton_Click(object sender, EventArgs e)
        {
            // Считывание полей
            scheme.Vcc = Convert.ToDouble(VccTextBox.Text);
            scheme.Ic = Convert.ToDouble(IcTextBox.Text)/1000;
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

            // Расчёт параметров
            RbTextBox.Text = scheme.Rb.ToString();
            RcTextBox.Text = scheme.Rc.ToString();

            IcTable.Rows[0].Cells[1].Text = scheme.hfeMin.ToString();
            IcTable.Rows[0].Cells[2].Text = scheme.hfeTyp.ToString();
            IcTable.Rows[0].Cells[3].Text = scheme.hfeMax.ToString();
            IcTable.Rows[1].Cells[0].Text = scheme.TcMin.ToString();
            IcTable.Rows[2].Cells[0].Text = scheme.TcTyp.ToString();
            IcTable.Rows[3].Cells[0].Text = scheme.TcMax.ToString();

            IcTable.Rows[1].Cells[1].Text = scheme.CalculateIc(scheme.hfeMin, scheme.TcMin).ToString("0.00");
            IcTable.Rows[1].Cells[2].Text = scheme.CalculateIc(scheme.hfeTyp, scheme.TcMin).ToString("0.00");
            IcTable.Rows[1].Cells[3].Text = scheme.CalculateIc(scheme.hfeMax, scheme.TcMin).ToString("0.00");
            IcTable.Rows[2].Cells[1].Text = scheme.CalculateIc(scheme.hfeMin, scheme.TcTyp).ToString("0.00");
            IcTable.Rows[2].Cells[2].Text = scheme.CalculateIc(scheme.hfeTyp, scheme.TcTyp).ToString("0.00");
            IcTable.Rows[2].Cells[3].Text = scheme.CalculateIc(scheme.hfeMax, scheme.TcTyp).ToString("0.00");
            IcTable.Rows[3].Cells[1].Text = scheme.CalculateIc(scheme.hfeMin, scheme.TcMax).ToString("0.00");
            IcTable.Rows[3].Cells[2].Text = scheme.CalculateIc(scheme.hfeTyp, scheme.TcMax).ToString("0.00");
            IcTable.Rows[3].Cells[3].Text = scheme.CalculateIc(scheme.hfeMax, scheme.TcMax).ToString("0.00");

            STable.Rows[1].Cells[1].Text = scheme.SIcbo(scheme.hfeTyp).ToString("0.00E+00");
            STable.Rows[2].Cells[1].Text = scheme.SInternalVbe(scheme.hfeTyp).ToString("0.00E+00");
            STable.Rows[3].Cells[1].Text = scheme.Shfe(scheme.hfeTyp).ToString("0.00E+00");
        }
    }
}