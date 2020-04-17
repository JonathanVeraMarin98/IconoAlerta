using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;

namespace IconoAlerta
{
    /// <summary>
    /// Descripción breve de Cambiar
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // Para permitir que se llame a este servicio web desde un script, usando ASP.NET AJAX, quite la marca de comentario de la línea siguiente. 
    [System.Web.Script.Services.ScriptService]
    public class Cambiar : System.Web.Services.WebService
    {
        private AlertaEntities modelo;
        


        [WebMethod]
        public void CambiarEstado2020(string notificacion)
        {
            modelo = new AlertaEntities();
            var query = (from p in modelo.Alertas
                         where p.notificacion == notificacion
                         select p).FirstOrDefault();

            query.estado = "I";
            modelo.SaveChanges();
        }

       
        
    }
}
