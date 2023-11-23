using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL
{
   public class COMPRA
    {
        DAL.MP_COMPRA mp = new DAL.MP_COMPRA();
        public void Insertar(BE.Compra compra)
        {
            mp.EstablecerID(compra);
            mp.Insertar(compra);

        }

        public void InsertarItem(BE.Item item, BE.Compra compra)
        {
            BE.Item i = (from BE.Item det in compra.Detalle
                         where det.PRODUCTO == item.PRODUCTO
                         select det).FirstOrDefault();


            if(i == null)
            {
                compra.Detalle.Add(item);
            }
            else
            {
                i.Cantidad += item.Cantidad;
            }


        }

    }
}
