# Alerta de gasto mensual. No frena nada ni cancela recursos: solo avisa por mail.
# AWS Budgets en sí no tiene costo (los primeros budgets son gratis).

resource "aws_budgets_budget" "monthly" {
  name         = "wilpel-papelera-mensual"
  budget_type  = "COST"
  limit_amount = "1"
  limit_unit   = "USD"
  time_unit    = "MONTHLY"

  # Avisa dos veces: cuando el gasto REAL llega al 80% y al 100% del límite.
  notification {
    comparison_operator        = "GREATER_THAN"
    threshold                  = 80
    threshold_type             = "PERCENTAGE"
    notification_type          = "ACTUAL"
    subscriber_email_addresses = [var.budget_alert_email]
  }

  notification {
    comparison_operator        = "GREATER_THAN"
    threshold                  = 100
    threshold_type             = "PERCENTAGE"
    notification_type          = "ACTUAL"
    subscriber_email_addresses = [var.budget_alert_email]
  }
}
