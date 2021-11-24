using Entidades.Sistema;
using Negocio.Pessoas;
using System;
using System.Reflection;
using System.Windows.Forms;

namespace InterfaceUsuario.Login
{
    public partial class FrmLogin : Form
    {
        // declaração da variável 
        public bool bFlagLogin;

        public FrmLogin()
        {
            InitializeComponent();
        }

        private void FrmLogin_Load(object sender, EventArgs e)
        {
            var versao = Assembly.GetExecutingAssembly().GetName().Version;

            // atribui o texto do lblVersao o valor de cada value da var versao
            lblVersao.Text = string.Format(lblVersao.Text,// {0}, {1}, {2}
                versao.Major,
                versao.Minor,
                versao.Build, 
                versao.Revision);

            // executa o método carregar usuários
            CarregarUsuarios();
        }

        private void CarregarUsuarios()
        {
            // consulta a lista de usuarios
            var listaDeUsuarios = new UsuarioNG().ListarUsuarios();
            // se a lista não está vazia
            if (listaDeUsuarios.Count > 0)
            {
                // loop
                // para cada usuario na lista de usuarios
                foreach (var usr in listaDeUsuarios)
                {
                    // acessa a lista de itens do combo  e adiciona nesta lista o objeto ComboBoxItemUsuario
                    cmbUsuarios.Items.Add( new ComboBoxItemUsuario(usr.Login,usr.Codigo, usr.Senha) );
                }
            }
        }

        private void btnSair_Click(object sender, EventArgs e)
        {
            Console.WriteLine("clicou em sair");
            // Fecha a tela de login
            Dispose();
            // sinaliza que usuario não fez login
            bFlagLogin = false;
        }

        private void btnEntrar_Click(object sender, EventArgs e)
        {

            // validar se usuario e senha correspondem ao bd
            // verifica se senha foi informada
            if (txtSenha.Text.Trim().Equals(string.Empty))
            {
                MessageBox.Show("Senha não informada.","Erro",MessageBoxButtons.OK,MessageBoxIcon.Error);
                return;
            }
            // verificar se o texto do combo do usuario está vazio
            if (cmbUsuarios.Text.Trim().Equals(string.Empty))
            {
                MessageBox.Show("Você deve selecionar o login para acessar o sistema.", "Erro", MessageBoxButtons.OK);
                return;
            }

            // 
            var usuarioSelecionado = (ComboBoxItemUsuario)cmbUsuarios.SelectedItem;

            if (usuarioSelecionado.Senha != txtSenha.Text)
            {
                MessageBox.Show("Senha incorreta.", "Erro", MessageBoxButtons.OK, MessageBoxIcon.Error);
                return;
            }

            // carrega o usuario da sessão
            Sessao.Usuario = new Entidades.Entidade(usuarioSelecionado.Codigo, usuarioSelecionado.Login);
            Sessao.TipoUsuario = new TipoUsuarioNG().BuscarTipoUsuarioDoUsuario(usuarioSelecionado.Codigo);

            bFlagLogin = true;

            Close();

        }
    }
}
