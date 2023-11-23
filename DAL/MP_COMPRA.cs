using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;
namespace DAL
{
    public class MP_COMPRA
    {
        private Acceso ac = new Acceso();

        public void EstablecerID(BE.Compra compra )
        {
            ac.Abrir();
            compra.Id=  ac.LeerEscalar("SiguienteCompra");
            ac.Cerrar();
        }


        public void Insertar(BE.Compra compra)
        {
            

            ac.Abrir();
            ac.IniciarTX();
            bool error = false;
            foreach(BE.Item item in compra.Detalle)
            {
                List<SqlParameter> parametros = new List<SqlParameter>();
                parametros.Add(ac.CrearParametro("@id",compra.Id));
                parametros.Add(ac.CrearParametro("@id_c",compra.CLIENTE.Id));
                parametros.Add(ac.CrearParametro("@id_p",item.PRODUCTO.Id));
                parametros.Add(ac.CrearParametro("@c", item.Cantidad));

                if(ac.Escribir("InsertarCompra",parametros) ==-1)
                {

                    error = true;
                }

            }
            if(!error)
            {
                ac.ConfirmarTx();
            }
            else
            {
                ac.RollbackTx();

            }
            ac.Cerrar();
        }

    }
}
