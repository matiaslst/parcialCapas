using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL
{
    public class Cliente
    {
        private DAL.mp_cliente mapper = new DAL.mp_cliente();
        public List<BE.Cliente> Listar() 
        {
            return mapper.Listar();
        }
        public void Grabar (BE.Cliente cliente)
        {
            if (cliente.Id == 0)
            {
                mapper.Insertar(cliente);
            }
            else
            {
                mapper.Modificar(cliente);
            }
        }


    }
}
