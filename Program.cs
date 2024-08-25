var builder = WebApplication.CreateBuilder(args);
var app = builder.Build();

app.MapGet("/", () => "Hello World, from AKS....We are successful... Finally ..My web hook is successfulllll");

app.Run();
