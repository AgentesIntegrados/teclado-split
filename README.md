### vial-gui

# Documentação e primeiros passos

### Por favor visite [get.vial.today](https://get.vial.today/) para começar com o Vial

O Vial é uma interface gráfica de código aberto multiplataforma (Windows, Linux e Mac) e um fork do QMK para configurar seu teclado em tempo real.


![](https://get.vial.today/img/vial-win-1.png)


---


#### Lançamentos

Visite https://get.vial.today/ para baixar uma versão binária do Vial.

#### Desenvolvimento

Python 3.6 é recomendado (3.6 é a versão mais recente oficialmente suportada pelo `fbs`).

Instalar dependências:

```
python3 -m venv venv
source venv/bin/activate
pip install -r requirements.txt
```

Para executar a aplicação posteriormente:

```
source venv/bin/activate
fbs run
```