# Yagla.cs
Web-API for [yagla.ru](https://yagla.ru/) an website that serves as link shortening tool

## Example
```cs
using System;
using YaglaApi;

namespace Application
{
    internal class Program
    {
        static async Task Main()
        {
            var api = new Yagla();
            string shortLink = await api.GenerateShortLink("https://example.com");
            Console.WriteLine(shortLink);
        }
    }
}
```
