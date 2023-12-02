using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Examen2
{
    public partial class Asignaciones : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LlenarGrid();
            }
        }

        public void alertas(String texto)
        {
            string message = texto;
            System.Text.StringBuilder sb = new System.Text.StringBuilder();
            sb.Append("<script type = 'text/javascript'>");
            sb.Append("window.onload=function(){");
            sb.Append("alert('");
            sb.Append(message);
            sb.Append("')};");
            sb.Append("</script>");
            ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", sb.ToString());

        }

        protected void LlenarGrid()
        {
            string constr = ConfigurationManager.ConnectionStrings["conexion"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("SELECT *  FROM Asignaciones"))
                {
                    using (SqlDataAdapter sda = new SqlDataAdapter())
                    {
                        cmd.Connection = con;
                        sda.SelectCommand = cmd;
                        using (DataTable dt = new DataTable())
                        {
                            sda.Fill(dt);
                            datagrid.DataSource = dt;
                            datagrid.DataBind();
                        }
                    }
                }
            }
        }

        protected void Button5_Click(object sender, EventArgs e)
        {
            int valor = Clases.Asignaciones.Agregar(TIdReparacion.Text,TIdTecnico.Text,TFechaAsig.Text);

            if (valor > 0)
            {
                alertas("Asignacion ingresada con exito");
                LlenarGrid();
            }
            else
            {
                alertas("Error al ingresar Asignacion");
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            int valor = Clases.Asignaciones.Borrar(int.Parse(TIdasignacion.Text));

            if (valor > 0)
            {
                alertas("La asignacion fue borrado con exito");
                LlenarGrid();
            }
            else
            {
                alertas("Error al borrar asignacion");
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            int valor = Clases.Asignaciones.Modificar(int.Parse(TIdasignacion.Text), TIdReparacion.Text, TIdTecnico.Text, TFechaAsig.Text);

            if (valor > 0)
            {
                alertas("La Asignacion fue modificada con exito");
                LlenarGrid();
            }
            else
            {
                alertas("Error al modificar asignacion");
            }
        }
        protected void Filtro()
        {
            string constr = ConfigurationManager.ConnectionStrings["conexion"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("SELECT *  FROM Asignaciones where AsignacionID= " + TIdasignacion.Text + ""))
                {
                    using (SqlDataAdapter sda = new SqlDataAdapter())
                    {
                        cmd.Connection = con;
                        sda.SelectCommand = cmd;
                        using (DataTable dt = new DataTable())
                        {
                            sda.Fill(dt);
                            datagrid.DataSource = dt;
                            datagrid.DataBind();
                        }
                    }
                }
            }
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            Filtro();
        }
    }
}