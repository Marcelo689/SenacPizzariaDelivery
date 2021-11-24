using InterfaceUsuario.Login;
using InterfaceUsuario.Pessoas;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace InterfaceUsuario
{
    public partial class MDIFrm : Form
    {
        // Construtor
        public MDIFrm()
        {
            InitializeComponent();
            MaximizeBox = false;
            MinimizeBox = false;
            
        }

        protected override void WndProc(ref Message m)
        {
            const int WM_SYSCOMMAND = 0x0112;
            const int SC_MOVE = 0xF010;
            const int WM_NCLBUTTONDBLCLK = 0x00A3; //double click on a title bar a.k.a. non-client area of the form

            switch (m.Msg)
            {
                case WM_SYSCOMMAND:             //preventing the form from being moved by the mouse.
                    int command = m.WParam.ToInt32() & 0xfff0;
                    if (command == SC_MOVE)
                        return;
                    break;
            }

            if (m.Msg == WM_NCLBUTTONDBLCLK)       //preventing the form being resized by the mouse double click on the title bar.
            {
                m.Result = IntPtr.Zero;
                return;
            }

            base.WndProc(ref m);
        }

        private void MDIFrm_Load(object sender, EventArgs e)
        {
            foreach(Control control in Controls)
            {
                if(control is MdiClient) // testar se controle é Mdi
                {
                    control.BackgroundImage = Properties.Resources.fundo;
                    control.BackgroundImageLayout = ImageLayout.Stretch;
                    break;
                }
            }
            // cria uma variável do tipo FrmLogin
            var frmLogin = new FrmLogin();
            // exibe o formulário de login em modal
            frmLogin.ShowDialog();

            // verificar se o usuario logou ou não
            if (!frmLogin.bFlagLogin)
            {
                Application.Exit();
            }
        }

        private void sairToolStripMenuItem_Click(object sender, EventArgs e)
        {
            Application.Exit();
        }

        private void relatóriosToolStripMenuItem_Click(object sender, EventArgs e)
        {
            MessageBox.Show("Em construção");
        }

        private void usuáriosToolStripMenuItem_Click(object sender, EventArgs e)
        {
            AbrirFormularios(new FrmCadUsuarios());
        }

        private void AbrirFormularios(Form form)
        {
            // abre no modo restaurado
            form.WindowState = FormWindowState.Normal;
            // habilita a posição manual
            form.StartPosition = FormStartPosition.Manual;
            // define que o form pai é a tela principal
            form.MdiParent = this;
            // seta as coordenadas da tela
            form.Top = 0;
            form.Left = 0;
            // exibe a tela
            form.Show();
        }

        private void clientesToolStripMenuItem_Click(object sender, EventArgs e)
        {
            AbrirFormularios(new FrmCadCliente());
        }
    }
}
