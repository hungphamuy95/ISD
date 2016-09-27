using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Text;
using System.Security.Cryptography;
using System.Collections;
using System.Web.Caching;

namespace OnlineShop.Common
{
    public static class Encryted
    {
        /// <summary>
        /// Author: Phạm Huy Hùng
        /// Todo: lớp mã hóa mật khẩu bằng MD5
        /// </summary>
        /// <param name=""></param>
        /// <returns></returns>\
        public static string MD5Hash(string text)
        {
            MD5 md5 = new MD5CryptoServiceProvider();

            //compute hash from the bytes of text
            md5.ComputeHash(ASCIIEncoding.ASCII.GetBytes(text));

            //get hash result after compute it
            byte[] result = md5.Hash;

            StringBuilder strBuilder = new StringBuilder();
            for (int i = 0; i < result.Length; i++)
            {
                //change it into 2 hexadecimal digits
                //for each byte
                strBuilder.Append(result[i].ToString("x2"));
            }

            return strBuilder.ToString();
        }

    }
    
}