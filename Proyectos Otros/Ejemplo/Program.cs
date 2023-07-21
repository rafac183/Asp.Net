using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using NGeoNames;
using NGeoNames.Entities;
using NGeoNames.Composers;
using NGeoNames.Parsers;
using System.IO;
using System.Globalization;
using Ejemplo;

namespace Ejemplo
{
    internal class Program
    {
        static void Main(string[] args)
        {
            Chile ejemplo = new Chile();
            ejemplo.regiones("hkj");
            ejemplo.provincias(null, "oijubk");
            ejemplo.comunas(null, "iuyuv");
        }
    }
}
