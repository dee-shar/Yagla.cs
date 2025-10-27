using System.Net.Http;
using System.Net.Http.Json;
using System.Net.Http.Headers;

namespace YaglaApi
{
    public class Yagla
    {
        private readonly HttpClient httpClient;
        private readonly string apiUrl = "https://yagla.ru/tools";
        public Yagla()
        {
            httpClient = new HttpClient();
            httpClient.DefaultRequestHeaders.UserAgent.ParseAdd(
                "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.0.0 Safari/537.36");
            httpClient.DefaultRequestHeaders.Accept.Add(
                new MediaTypeWithQualityHeaderValue("application/json"));
        }

        public async Task<string> GenerateShortLink(string link)
        {
            var response = await httpClient.PostAsync(
                $"{apiUrl}/generateShortLink", JsonContent.Create(new { link = link }));
            return await response.Content.ReadAsStringAsync();
        }
    }
}
