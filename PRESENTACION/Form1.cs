using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace PRESENTACION
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }
        BE.Cliente cliente = new BE.Cliente();
        private void button1_Click(object sender, EventArgs e)
        {
            textBox1.Text = "";
            textBox2.Text = "";
            button3.Enabled = false;
            button2.Enabled = true;
            cliente = new BE.Cliente();
        }
        BLL.Cliente gestor = new BLL.Cliente();
        private void button2_Click(object sender, EventArgs e)
        {
            if (String.IsNullOrWhiteSpace (textBox1.Text)|| String.IsNullOrWhiteSpace (textBox2.Text))
            {
                MessageBox.Show("Completa los datos");
            }
            else
            {
                cliente.Nombre = textBox1.Text;
                cliente.Apellido = textBox2.Text;
                gestor.Grabar(cliente);
                cliente = null;
                button2.Enabled = false;
                button3.Enabled = false;
                Enlazar();
            }
        }
        public void Enlazar ()
        {
            dataGridView1.DataSource = null;
            comboBox1.DataSource = null;
            List<BE.Cliente> clientes = gestor.Listar();
            dataGridView1.DataSource = clientes;
            comboBox1.DataSource = clientes;

        }
        private void button3_Click(object sender, EventArgs e)
        {
            cliente.Borrado = 1;
            gestor.Grabar(cliente);
            cliente = null;
            button2.Enabled = false;
            button3.Enabled = false;
            Enlazar();

        }

        private void Form1_Load(object sender, EventArgs e)
        {
            BLL.PRODUCTO gestorp = new BLL.PRODUCTO();
            comboBox2.DataSource = gestorp.Listar();
           
            Enlazar();
        }

        private void dataGridView1_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            cliente = (BE.Cliente)dataGridView1.Rows[e.RowIndex].DataBoundItem;
            textBox1.Text = cliente.Nombre;
            textBox2.Text = cliente.Apellido;
            button2.Enabled = true;
            button3.Enabled = true;
            textBox1.Focus();

        }
        BE.Compra compra;
        private void button4_Click(object sender, EventArgs e)
        {
            button5.Enabled = true;
            button6.Enabled = false;
            compra = new BE.Compra();
            
            
        }

        void EnlazarCarrito()
        {
            dataGridView2.DataSource = null;
            dataGridView2.DataSource = compra.Detalle;

        }

        private void button6_Click(object sender, EventArgs e)
        {
            button5.Enabled = false;
            button6.Enabled = false;
            compra.CLIENTE = (BE.Cliente)comboBox1.SelectedItem;
            gestorCompra.Insertar(compra);
            compra = null;
            dataGridView2.DataSource = null;
        }

        BLL.COMPRA gestorCompra = new BLL.COMPRA();
        private void button5_Click(object sender, EventArgs e)
        {
            button6.Enabled = true;
            BE.Item item = new BE.Item();
            item.Cantidad = int.Parse(maskedTextBox1.Text);
            item.PRODUCTO = (BE.Producto)comboBox2.SelectedItem;
            gestorCompra.InsertarItem(item,compra);
            EnlazarCarrito();
        }
    }
}
