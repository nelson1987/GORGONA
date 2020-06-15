FROM microsoft/dotnet:2.2-aspnetcore-runtime-nanoserver-1803 AS base
WORKDIR /app
EXPOSE 80

FROM microsoft/dotnet:2.2-sdk-nanoserver-1803 AS build
WORKDIR /src
COPY ["Gorgona.Api/Gorgona.Api.csproj", "Gorgona.Api/"]
RUN dotnet restore "Gorgona.Api/Gorgona.Api.csproj"
COPY . .
WORKDIR "/src/Gorgona.Api"
RUN dotnet build "Gorgona.Api.csproj" -c Release -o /app

FROM build AS publish
RUN dotnet publish "Gorgona.Api.csproj" -c Release -o /app

FROM base AS final
WORKDIR /app
COPY --from=publish /app .
ENTRYPOINT ["dotnet", "Gorgona.Api.dll"]