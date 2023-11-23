using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BE
{
    public class Compra
    {
        private int id;

        public int Id
        {
            get { return id; }
            set { id = value; }
        }

        private List<Item> detalle = new List<Item>();

        public List<Item> Detalle
        {
            get { return detalle; }           
        }

        private Cliente cliente;

        public Cliente CLIENTE
        {
            get { return cliente; }
            set { cliente = value; }
        }

        private float total;

        public float Total
        {
            get { return total; }
            set { total = value; }
        }


    }
}
