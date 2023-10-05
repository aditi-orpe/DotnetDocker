# Use the official .NET Core runtime as a parent image
FROM mcr.microsoft.com/dotnet/aspnet:6.0 AS base
WORKDIR /app
EXPOSE 80

# Use the official .NET Core SDK as a parent image to build the application
FROM mcr.microsoft.com/dotnet/sdk:6.0 AS build
WORKDIR /src
COPY ["DotnetDocker/DotnetDocker.csproj", "DotnetDocker/"]
RUN dotnet restore "DotnetDocker/DotnetDocker.csproj"
COPY . .
WORKDIR "/src/DotnetDocker"
RUN dotnet build "DotnetDocker.csproj" -c Release -o /app/build

# Publish the application for release
FROM build AS publish
RUN dotnet publish "DotnetDocker.csproj" -c Release -o /app/publish

# Build the final image using the base image and published application
FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "DotnetDocker.dll"]
