using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace IconoAlerta
{
    public partial class _Default : Page 
    {
        private AlertaEntities modelo;

        

        public string Alertajs { get; set; }

        

        protected void Page_Load(object sender, EventArgs e)
        {
            LlenarAlerta();
            
        }

        public void LlenarAlerta()
        {
            modelo = new AlertaEntities();
            
            List<Alerta> alertas;
            alertas = (from p in modelo.Alertas
                       where p.estado == "A"
                       select p).ToList();

            Alertajs = JsonConvert.SerializeObject(alertas);
        }

        
    }

    


 }
