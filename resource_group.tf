# Azure プロバイダーの設定
# このコードは、名前が aks-rg で場所が japaneast のリソース グループを作成します。2 名前や場所は、変数やランダムな値を使ってカスタマイズすることができます。1 詳細な手順や設定については、以下のリンクを参照してください。
provider "azurerm" {
  features {}
}

# リソース グループの作成
resource "azurerm_resource_group" "aks" {
  name     = "aks-rg"
  location = "japaneast"
}