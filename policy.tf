# Policy Definition の作成
# このコードは、名前や効果などの変数を使って Policy Definition と Policy Assignment を作成します。2 変数は、別のファイルで定義するか、コマンドラインで指定することができます。3 Policy Definition の policy_rule と parameters は、JSON 形式で記述します。 詳細な手順や設定については、以下のリンクを参照してください。

resource "azurerm_policy_definition" "pd" {
  name         = var.pd_name
  policy_type  = "Custom"
  mode         = "All"
  display_name = var.pd_display_name
  description  = var.pd_description

  policy_rule = <<POLICY_RULE
{
  "if": {
    "allOf": [
      {
        "field": "type",
        "equals": "Microsoft.Compute/virtualMachines"
      },
      {
        "field": "Microsoft.Compute/virtualMachines/osProfile.windowsConfiguration",
        "exists": false
      }
    ]
  },
  "then": {
    "effect": "[parameters('effect')]"
  }
}
POLICY_RULE

  parameters = <<PARAMETERS
{
  "effect": {
    "type": "String",
    "metadata": {
      "displayName": "Effect",
      "description": "Enable or disable the execution of the policy"
    },
    "allowedValues": [
      "Audit",
      "Deny",
      "Disabled"
    ],
    "defaultValue": "Audit"
  }
}
PARAMETERS
}


# Policy Assignment の作成
resource "azurerm_policy_assignment" "pa" {
  name                 = var.pa_name
  scope                = data.azurerm_subscription.current.id
  policy_definition_id = azurerm_policy_definition.pd.id
  description          = var.pa_description
  display_name         = var.pa_display_name

  parameters = <<PARAMETERS
{
   "effect": {
     "value": "${var.pa_effect}"
   }
}
PARAMETERS
}