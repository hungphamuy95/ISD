using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Text;
using System.Security.Cryptography;
using System.Collections;
using System.Web.Caching;

namespace TK.Business.Common
{
    public class Encryted
    {
        /// <summary>
        /// Author: Phạm Huy Hùng
        /// Todo: lớp mã hóa mật khẩu bằng MD5
        /// </summary>
        /// <param name=""></param>
        /// <returns></returns>\
        public string MD5Hash(string text)
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
    /// <summary>
    /// Author: Phạm Huy Hùng
    /// Todo: xóa bộ nhớ cache trên trình duyệt
    /// </summary>
    /// <param name=""></param>
    /// <returns></returns>\
    public static class Security
    {
        public static void ClearApplicationCache()
        {
            List<string> keys = new List<string>();

            // retrieve application Cache enumerator
            Cache fuck = new Cache();
           
            // copy all keys that currently exist in Cache
            while (fuck.GetEnumerator().MoveNext())
            {
                keys.Add(fuck.GetEnumerator().Key.ToString());
            }

            // delete every key from cache
            for (int i = 0; i < keys.Count; i++)
            {
                fuck.Remove(keys[i]);
            }
        }
    }
    /// <summary>
    /// Author: Phạm Huy Hùng
    /// Todo: loại bỏ kí tự và dấu tiếng việt
    /// </summary>
    /// <param name=""></param>
    /// <returns></returns>\
    public class Rewrite
    {
        public string RemoveUnicode(string text)
        {
            string[] arr1 = new string[] { "á", "à", "ả", "ã", "ạ", "â", "ấ", "ầ", "ẩ", "ẫ", "ậ", "ă", "ắ", "ằ", "ẳ", "ẵ", "ặ",
    "đ",
    "é","è","ẻ","ẽ","ẹ","ê","ế","ề","ể","ễ","ệ",
    "í","ì","ỉ","ĩ","ị",
    "ó","ò","ỏ","õ","ọ","ô","ố","ồ","ổ","ỗ","ộ","ơ","ớ","ờ","ở","ỡ","ợ",
    "ú","ù","ủ","ũ","ụ","ư","ứ","ừ","ử","ữ","ự",
    "ý","ỳ","ỷ","ỹ","ỵ",};
            string[] arr2 = new string[] { "a", "a", "a", "a", "a", "a", "a", "a", "a", "a", "a", "a", "a", "a", "a", "a", "a",
    "d",
    "e","e","e","e","e","e","e","e","e","e","e",
    "i","i","i","i","i",
    "o","o","o","o","o","o","o","o","o","o","o","o","o","o","o","o","o",
    "u","u","u","u","u","u","u","u","u","u","u",
    "y","y","y","y","y",};
            for (int i = 0; i < arr1.Length; i++)
            {
                text = text.Replace(arr1[i], arr2[i]);
                text = text.Replace(arr1[i].ToUpper(), arr2[i].ToUpper());
            }
            return text;
        }
    }
}
