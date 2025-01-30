using System;
using System.IO;

class Program
{
    static void Main()
    {
        Console.Write("Введите имя каталога: ");
        string directoryPath = Console.ReadLine();

        if (Directory.Exists(directoryPath))
        {
            string[] files = Directory.GetFiles(directoryPath);

            foreach (string file in files)
            {
                string extension = Path.GetExtension(file).TrimStart('.').ToUpper();
                string destinationFolder = Path.Combine(directoryPath, extension);

                if (!Directory.Exists(destinationFolder))
                {
                    Directory.CreateDirectory(destinationFolder);
                }

                string destinationFile = Path.Combine(destinationFolder, Path.GetFileName(file));
                File.Move(file, destinationFile);
            }

            Console.WriteLine("Файлы успешно отсортированы по расширениям.");
        }
        else
        {
            Console.WriteLine("Указанный каталог не существует.");
        }
    }
}
