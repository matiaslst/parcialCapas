using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;

namespace DAL
{
    public class mp_producto
    {
        Acceso ac = new Acceso();
        public List<BE.Producto> Listar()
        {
            List <BE.Producto> productos = new List<BE.Producto>();
            ac.Abrir();
            DataTable tabla = ac.Leer("producto_listar");
            ac.Cerrar();
            foreach(DataRow registro in tabla.Rows)
            {
                BE.Producto p = new BE.Producto();
                p.Id = int.Parse(registro["Id_Producto"].ToString());
                p.Precio = float.Parse(registro["Precio"].ToString());
                p.Nombre = registro["Producto"].ToString();
                productos.Add(p);
            }
            return productos;
        }



    }
}
