using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;

namespace DAL
{
    public class mp_cliente
    {
        private Acceso ac = new Acceso();

        public List<BE.Cliente> Listar ()
        {
            List<BE.Cliente> clientes = new List<BE.Cliente>();
            ac.Abrir();
            DataTable tabla = ac.Leer("cliente_listar");
            ac.Cerrar();

            foreach (DataRow registro in tabla.Rows)
            {
                BE.Cliente cliente = new BE.Cliente();
                cliente.Id = int.Parse(registro["id_cliente"].ToString());
                cliente.Nombre = registro["nombre"].ToString();
                cliente.Apellido = registro["apellido"].ToString();
                cliente.Borrado = int.Parse(registro["borrado"].ToString());
                clientes.Add(cliente);
            }
            return clientes;
        }
        public int Insertar (BE.Cliente cliente)
        {
            List<SqlParameter> parametros = new List<SqlParameter>();
            parametros.Add(ac.CrearParametro("@nom", cliente.Nombre));
            parametros.Add(ac.CrearParametro("@ape", cliente.Apellido));
            ac.Abrir();
            int resultado = ac.Escribir("cliente_insertar",parametros);
            ac.Cerrar();
            return resultado;
        }
        public int Modificar(BE.Cliente cliente)
        {
            List<SqlParameter> parametros = new List<SqlParameter>();
            parametros.Add(ac.CrearParametro("@id", cliente.Id));
            parametros.Add(ac.CrearParametro("@b", cliente.Borrado));

            parametros.Add(ac.CrearParametro("@nom", cliente.Nombre));
            parametros.Add(ac.CrearParametro("@ape", cliente.Apellido));
            ac.Abrir();
            int resultado = ac.Escribir("cliente_editar", parametros);
            ac.Cerrar();
            return resultado;
        }
    }
}
