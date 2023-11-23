using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL
{
  public class PRODUCTO
    {
        DAL.mp_producto mp = new DAL.mp_producto();

        public List<BE.Producto> Listar()
        {

            return mp.Listar();
        }

    }
}
