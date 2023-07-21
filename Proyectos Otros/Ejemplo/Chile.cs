﻿using NGeoNames;
using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.IO;
using NGeoNames.Entities;
using NGeoNames.Composers;
using NGeoNames.Parsers;

namespace Ejemplo
{
    public class Chile
    {
        public string datadir = @"E:\test\geo\";
        public string datadir2 = @"E:\test\geo\CL.txt";

        public void regiones(string si = "")
        {
            GeoFileDownloader downloader = GeoFileDownloader.CreateGeoFileDownloader();
            downloader.DownloadFile("CL.zip", datadir);    // Zipfile will be automatically extracted

            // Read data into memory
            var data = GeoFileReader.ReadExtendedGeoNames(datadir2).Where(p => p.CountryCode.Equals("CL", StringComparison.OrdinalIgnoreCase)).ToArray();

            var regions = data.Where(p => p.FeatureCode.Equals("ADM1")).OrderBy(p => p.Name);

            
            if(si.Length > 0)
            {
                var regionMasLarga = regions.OrderByDescending(region => region.Name.Length).FirstOrDefault();

                // Imprime el nombre de la región más larga
                if (regionMasLarga != null)
                {
                    Console.WriteLine(
                        string.Format(
                            CultureInfo.InvariantCulture, "La región más larga es: {0} \nTeniendo: {1} caracteres", regionMasLarga.Name, regionMasLarga.Name.Length
                        )
                    );
                }
            } else
            {
                foreach (var region in regions)
                {
                    Console.WriteLine(
                        string.Format(
                            CultureInfo.InvariantCulture, "{0}",
                            region.Name
                        )
                    );
                }
            }
        }

        public void provincias(string region, string si = "")
        {
            GeoFileDownloader downloader = GeoFileDownloader.CreateGeoFileDownloader();
            downloader.DownloadFile("CL.zip", datadir);    // Zipfile will be automatically extracted

            // Read data into memory
            var data = GeoFileReader.ReadExtendedGeoNames(datadir2).Where(p => p.CountryCode.Equals("CL", StringComparison.OrdinalIgnoreCase)).ToArray();
            
            

            if (region != null)
            {
                var regionInfo = data.FirstOrDefault(p => p.FeatureCode.Equals("ADM1") && p.Name.Equals(region, StringComparison.OrdinalIgnoreCase));
                if (regionInfo != null)
                {
                    var provincias = data.Where(p => p.FeatureCode.Equals("ADM2") && p.Admincodes[0].Equals(regionInfo.Admincodes[0])).OrderBy(p => p.Name);

                    if (provincias.Any())
                    {
                        foreach (var provincia in provincias)
                        {
                            Console.WriteLine(
                                string.Format(
                                    CultureInfo.InvariantCulture, "{0}",
                                    provincia.Name
                                )
                            );
                        }
                    }
                    else
                    {
                        Console.WriteLine("No hay datos");
                    }
                }
                else
                {
                    Console.WriteLine("Región no encontrada.");
                }
            }
            else
            {
                var provincias = data.Where(p => p.FeatureCode.Equals("ADM2")).OrderBy(p => p.Name);
                if(si.Length == 0)
                {
                    foreach (var provincia in provincias)
                    {
                        Console.WriteLine(
                            string.Format(
                                CultureInfo.InvariantCulture, "{0}",
                                provincia.Name
                            )
                        );
                    }
                } else
                {
                    var regionMasLarga = provincias.OrderByDescending(provincia => provincia.Name.Length).FirstOrDefault();

                    // Imprime el nombre de la región más larga
                    if (regionMasLarga != null)
                    {
                        Console.WriteLine(
                            string.Format(
                                CultureInfo.InvariantCulture, "La Provincia más larga es: {0} \nTeniendo: {1} caracteres", regionMasLarga.Name, regionMasLarga.Name.Length
                            )
                        );
                    }
                }

            }
        }

        public void comunas(string provincia, string si = "")
        {
            GeoFileDownloader downloader = GeoFileDownloader.CreateGeoFileDownloader();
            downloader.DownloadFile("CL.zip", datadir);    // Zipfile will be automatically extracted

            // Read data into memory
            var data = GeoFileReader.ReadExtendedGeoNames(datadir2).Where(p => p.CountryCode.Equals("CL", StringComparison.OrdinalIgnoreCase)).ToArray();

            if (provincia != null)
            {
                var provinciaInfo = data.FirstOrDefault(p => p.FeatureCode.Equals("ADM2") && p.Name.Equals(provincia, StringComparison.OrdinalIgnoreCase));
                if (provinciaInfo != null)
                {
                    var comunas = data.Where(p => p.FeatureCode.Equals("ADM3") && p.Admincodes[1].Equals(provinciaInfo.Admincodes[1])).OrderBy(p => p.Name);

                    if (comunas.Any())
                    {
                        foreach (var comuna in comunas)
                        {
                            Console.WriteLine(
                                string.Format(
                                    CultureInfo.InvariantCulture, "{0}",
                                    comuna.Name
                                )
                            );
                        }
                    }
                    else
                    {
                        Console.WriteLine("No hay datos");
                    }
                }
                else
                {
                    Console.WriteLine("Región no encontrada.");
                }
            }
            else
            {
                var comunas = data.Where(p => p.FeatureCode.Equals("ADM3")).OrderBy(p => p.Name);
                if (si.Length == 0)
                {
                    foreach (var comuna in comunas)
                    {
                        Console.WriteLine(
                            string.Format(
                                CultureInfo.InvariantCulture, "{0}",
                                comuna.Name
                            )
                        );
                    }
                }
                else
                {
                    var regionMasLarga = comunas.OrderByDescending(comuna => comuna.Name.Length).FirstOrDefault();

                    // Imprime el nombre de la región más larga
                    if (regionMasLarga != null)
                    {
                        Console.WriteLine(
                            string.Format(
                                CultureInfo.InvariantCulture, "La Comuna más larga es: {0} \nTeniendo: {1} caracteres", regionMasLarga.Name, regionMasLarga.Name.Length
                            )
                        );
                    }
                }
            }

        }
    }
}
