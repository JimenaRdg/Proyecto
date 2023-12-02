using Examen2.Clases;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Examen2
{
    public partial class LOGIN : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Bingresar_Click(object sender, EventArgs e)
        {
            Clases.UsuarioLogin objUsuarios = new Clases.UsuarioLogin(Tusuario.Text, Tclave.Text);
            if (UsuarioLogin.ValidarLogin() > 0)
            {
                Response.Redirect("Inicio.aspx");

            }
        }
    }
}