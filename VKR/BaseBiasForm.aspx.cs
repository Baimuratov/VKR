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
        protected void Page_Load(object sender, EventArgs e)
        {
            BaseBias scheme = new BaseBias();

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

            Table1.Rows[0].Cells[1].Text = scheme.hfeMin.ToString();
            Table1.Rows[0].Cells[2].Text = scheme.hfeTyp.ToString();
            Table1.Rows[0].Cells[3].Text = scheme.hfeMax.ToString();
            Table1.Rows[1].Cells[0].Text = scheme.TcMin.ToString();
            Table1.Rows[2].Cells[0].Text = scheme.TcTyp.ToString();
            Table1.Rows[3].Cells[0].Text = scheme.TcMax.ToString();

            Table1.Rows[1].Cells[1].Text = scheme.CalculateIc(scheme.hfeMin, scheme.TcMin).ToString();
            Table1.Rows[1].Cells[2].Text = scheme.CalculateIc(scheme.hfeTyp, scheme.TcMin).ToString();
            Table1.Rows[1].Cells[3].Text = scheme.CalculateIc(scheme.hfeMax, scheme.TcMin).ToString();
            Table1.Rows[2].Cells[1].Text = scheme.CalculateIc(scheme.hfeMin, scheme.TcTyp).ToString();
            Table1.Rows[2].Cells[2].Text = scheme.CalculateIc(scheme.hfeTyp, scheme.TcTyp).ToString();
            Table1.Rows[2].Cells[3].Text = scheme.CalculateIc(scheme.hfeMax, scheme.TcTyp).ToString();
            Table1.Rows[3].Cells[1].Text = scheme.CalculateIc(scheme.hfeMin, scheme.TcMax).ToString();
            Table1.Rows[3].Cells[2].Text = scheme.CalculateIc(scheme.hfeTyp, scheme.TcMax).ToString();
            Table1.Rows[3].Cells[3].Text = scheme.CalculateIc(scheme.hfeMax, scheme.TcMax).ToString();
        }
    }
}