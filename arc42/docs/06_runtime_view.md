## 6. Laufzeitsicht
### Szenario „Fallanalyse“
1. Nutzer legt Fall an → Zweck + Rechtsgrundlage werden registriert
2. Query Engine prüft Policy (Case, Zweck, Nutzerrolle)
3. Daten werden pseudonymisiert geladen
4. Ergebnisse nur im Case-Scope sichtbar
5. Alle Schritte werden im Audit-Log erfasst

### Szenario „Rasterfahndung“
- Standardmäßig blockiert
- Nur via Anordnungs-Workflow + richterlichem Beschluss möglich  

![04_dynamic.svg](../diagrams/04_dynamic.svg)