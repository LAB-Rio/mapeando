# Documentação da API





### Demandas

Demandas são os principais objetos no Mapeando. É a principal ação do usuário logo após "apoiar" uma demanda mapeada. Toda demanda vem com seus "filhos" (entidades relacionadas) quando é feita requisição.

#### Requisição GET de todas as demandas:

- ` GET /demands.json ` retorna um array contendo objetos de demandas.
- ` GET /demands/:id.json` retorna um array contendo um objeto de uma demanda.
- ` GET /demands.json?by_category_id=:category_id` retorna um array de demandas filtradas por categorias

##### Resposta: 

```javascript

{ 
  "demands": [ 
      { 
        id: 1,          /* (Integer) ID  da demanda no sistema */
        fullname: "",   /* (String) Comentário do usuário na demanda */
        user_id: 1,     /* (Integer) ID do usuário no sistema */
        category_id: 1, /* (Integer) ID  do tipo de categoria no sistema */
        
        category: { // (Object) Objeto contendo a categoria a que pertence a demanda
        
          name: "",         // (String) Nome da categoria a que pertence a demanda 
          travel_mode: "",  // (String) (BIKING | WALKING| DRIVING | BUS) Tipo de modo a que pertence a categoria.
          icon_url: ""      // (String) URL da imagem que representa a demanda no mapa
        },
        
        user: { // (Object) Objeto contendo o usuario que criou a demanda
          first_name: "",
          last_name "",
          avatar: "",
          district: "",
        },
        
        pins: [
          {
            lat: "",
            long: "",
            fullname: "",
          }
        ],
        
      },
    ]
  }


```
