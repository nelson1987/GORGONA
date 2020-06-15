##Depending on the operating system of the host machines(s) that will build or run the containers, the image specified in the FROM statement may need to be changed.
##For more information, please see http://aka.ms/containercompat 
#
#FROM microsoft/dotnet:2.2-aspnetcore-runtime-nanoserver-1803 AS base
#WORKDIR /app
#EXPOSE 80
#
#FROM microsoft/dotnet:2.2-sdk-nanoserver-1803 AS build
#WORKDIR /src
#COPY Gorgona.Api/Gorgona.Api.csproj Gorgona.Api/
#RUN dotnet restore Gorgona.Api/Gorgona.Api.csproj
#COPY . .
#WORKDIR /src/Gorgona.Api
#RUN dotnet build Gorgona.Api.csproj -c Release -o /app
#
#FROM build AS publish
#RUN dotnet publish Gorgona.Api.csproj -c Release -o /app
#
#FROM base AS final
#WORKDIR /app
#COPY --from=publish /app .
#ENTRYPOINT ["dotnet", "Gorgona.Api.dll"]
#

#FROM microsoft/dotnet:2.2-sdk-nanoserver-1803 AS build
#WORKDIR /src
#COPY Gorgona.Api/Gorgona.Api.csproj Gorgona.Api/
#RUN dotnet restore Gorgona.Api/Gorgona.Api.csproj
#COPY . .
#WORKDIR /src/Gorgona.Api
#RUN dotnet build Gorgona.Api.csproj -c Release -o /app

FROM mcr.microsoft.com/dotnet/core/aspnet:2.2
COPY bin/Release/netcoreapp2.2 App/
WORKDIR /App
ENTRYPOINT ["dotnet", "Gorgona.Api.dll"]
EXPOSE 80