# Log Analytics workspace との関連付け
# このコードは、名前やカテゴリなどの変数を使って Azure Monitor を作成します。2 変数は、別のファイルで定義するか、コマンドラインで指定することができます。3 詳細な手順や設定については、以下のリンクを参照してください。

resource "azurerm_monitor_diagnostic_setting" "mds" {
  name               = var.mds_name
  target_resource_id = azurerm_kubernetes_cluster.aks.id
  log_analytics_workspace_id = azurerm_log_analytics_workspace.law.id

  log {
    category = "kube-apiserver"
    enabled  = true

    retention_policy {
      enabled = false
    }
  }

  metric {
    category = "AllMetrics"

    retention_policy {
      enabled = false
    }
  }
}