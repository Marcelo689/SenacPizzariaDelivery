﻿using System;
using System.Windows.Forms;

namespace InterfaceUsuario.Modulos
{
    public static class MascaraCampoCodigo
    {
        public static void RetornarMascara(object sender, EventArgs args)
        {  
            TextBox txt = (TextBox)sender;
            if (txt.Text.Trim().Equals(string.Empty))
                return;
            // 5  = '00005'
            // 23 = '00023'
            txt.Text = Int32.Parse(txt.Text).ToString("00000");
        }

        public static void TirarMascara(object sender, EventArgs args)
        {
            TextBox txt = (TextBox)sender;
            if (txt.Text.Trim().Equals(string.Empty))
                return;
            txt.Text = Convert.ToInt32(txt.Text.Trim()).ToString();
            txt.Focus();
            txt.Select(0, txt.Text.Length);

            // 00004
            // 4
        }

        public static void ApenasValoresNumericos(object sender, KeyPressEventArgs e)
        {
            TextBox txt = (TextBox)sender;
            if(!char.IsDigit(e.KeyChar) && e.KeyChar != Convert.ToChar(Keys.Back))
            {
                e.Handled = true;
            }
        }

        public static void AplicarEventos(TextBox txt)
        {
            txt.Enter += TirarMascara;
            txt.Leave += RetornarMascara;
            txt.KeyPress += ApenasValoresNumericos;
        }
    }

}
