# IA e Big Data

Notebooks das aulas de IA e Big Data (2024-2) e o chatbot de 2025-1. Rodam no Jupyter ou no Colab com pandas, numpy, matplotlib, seaborn e scikit-learn; o chatbot usa gradio e groq.

## Projetos
- `2024-2/aula02-pandas` — `codigo2.ipynb`: DataFrames a partir de dicionários, índices nomeados e seleção de dados.
- `2024-2/aula05-regressao-linear` — `codigo.ipynb`: regressão linear simples em cinco cenários (vazão × nível, quantidade × temperatura, área × valor, gastos × renda, demanda × consumo) e gráficos com seaborn.
- `2024-2/aula06-arvore-decisao` — `codigoEx1` a `codigoEx5`: árvores de decisão para classificação (por exemplo, máquina que precisa ou não de manutenção), com acurácia, matriz de confusão e `plot_tree`.
- `2024-2/aula08-svm` — `codigo01`, `codigoEx1` a `codigoEx3` e `dadosclientes.csv`: SVM linear para máquina defeituosa, consumo de energia, pH × concentração e forma de pagamento.
- `2025-1/aula04-chatbot-groq` — `A04Chatbot` (função simples no Gradio), `A04.2Chatbot` e `A04.3Chatbot` (conversa com a API da Groq).

## Observações da revisão
Os resultados dos notebooks foram mantidos como entregues; o que segue é só anotação.
- aula05 (regressão linear): nos exercícios de renda × gastos e demanda × consumo, a variável usada como entrada (X) e a prevista (y) parecem trocadas em relação ao enunciado: `modelo.fit(gastos, renda)` prevê renda a partir de gastos e `modelo.fit(demanda, consumo)` prevê consumo a partir de demanda. Coeficientes e gráficos saem com os eixos invertidos.
- aula08 (SVM): `accuracy_score(yprev, y_test)` e `confusion_matrix(yprev, y_test)` passam os argumentos na ordem inversa da esperada pelo scikit-learn (`y_true, y_pred`). A acurácia não muda; a matriz de confusão sai transposta (linhas e colunas trocadas).
- aula06 (árvore de decisão): a última célula de `codigoEx2.ipynb` guarda um `InvalidParameterError` de `plot_tree` (`class_names` precisa ser lista); as células anteriores do mesmo notebook rodam.
- aula04 (chatbot): `A04.2` e `A04.3` traziam a chave da Groq no código. Nesta cópia a chave vem só da variável de ambiente `GROQ_API_KEY`, as saídas foram zeradas e uma célula no topo avisa que os modelos usados (`llama3-8b-8192` e `llama-3.2-3b-preview`) foram descontinuados pela Groq; use `llama-3.1-8b-instant`.
