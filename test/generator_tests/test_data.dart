const ref = '\$ref';

const carsService = '''
{
  "openapi": "3.0.1",
  "info": {
    "title": "RetailMarket API",
    "version": "1"
  },
  "paths": {
    "/api/v1/File/image/{fileHashCode}": {
      "post": {
        "tags": [
          "File"
        ],
        "operationId": "uploadFile",
        "parameters": [
          {
            "name": "fileHashCode",
            "in": "path",
            "required": true,
            "schema": {
              "type": "string"
            }
          }
        ],
        "requestBody": {
          "content": {
            "multipart/form-data": {
              "schema": {
                "type": "object",
                "properties": {
                  "file": {
                    "type": "string",
                    "format": "binary"
                  }
                }
              },
              "encoding": {
                "file": {
                  "style": "form"
                }
              }
            }
          }
        },
        "responses": {
          "200": {
            "description": "Success",
            "content": {
              "text/plain": {
                "schema": {
                  "type": "string"
                }
              },
              "application/json": {
                "schema": {
                  "type": "string"
                }
              },
              "text/json": {
                "schema": {
                  "type": "string"
                }
              }
            }
          }
        }
      }
    },
    "/api/v1/File/image/{id}": {
      "get": {
        "tags": [
          "File"
        ],
        "operationId": "downloadFile",
        "parameters": [
          {
            "name": "id",
            "in": "path",
            "required": true,
            "schema": {
              "type": "string"
            }
          }
        ],
        "responses": {
          "200": {
            "description": "Success"
          }
        }
      }
    },
    "/api/v1/Item": {
      "post": {
        "tags": [
          "Item"
        ],
        "operationId": "createItem",
        "requestBody": {
          "content": {
            "application/json": {
              "schema": {
                "$ref": "#/components/schemas/CreateItemDto"
              }
            },
            "text/json": {
              "schema": {
                "$ref": "#/components/schemas/CreateItemDto"
              }
            },
            "application/*+json": {
              "schema": {
                "$ref": "#/components/schemas/CreateItemDto"
              }
            }
          }
        },
        "responses": {
          "200": {
            "description": "Success",
            "content": {
              "text/plain": {
                "schema": {
                  "$ref": "#/components/schemas/GuidAppResult"
                }
              },
              "application/json": {
                "schema": {
                  "$ref": "#/components/schemas/GuidAppResult"
                }
              },
              "text/json": {
                "schema": {
                  "$ref": "#/components/schemas/GuidAppResult"
                }
              }
            }
          }
        }
      },
      "put": {
        "tags": [
          "Item"
        ],
        "operationId": "updateItem",
        "requestBody": {
          "content": {
            "application/json": {
              "schema": {
                "$ref": "#/components/schemas/UpdateItemDto"
              }
            },
            "text/json": {
              "schema": {
                "$ref": "#/components/schemas/UpdateItemDto"
              }
            },
            "application/*+json": {
              "schema": {
                "$ref": "#/components/schemas/UpdateItemDto"
              }
            }
          }
        },
        "responses": {
          "200": {
            "description": "Success",
            "content": {
              "text/plain": {
                "schema": {
                  "$ref": "#/components/schemas/BooleanAppResult"
                }
              },
              "application/json": {
                "schema": {
                  "$ref": "#/components/schemas/BooleanAppResult"
                }
              },
              "text/json": {
                "schema": {
                  "$ref": "#/components/schemas/BooleanAppResult"
                }
              }
            }
          }
        }
      }
    },
    "/api/v1/Item/{itemUId}": {
      "delete": {
        "tags": [
          "Item"
        ],
        "operationId": "deleteItem",
        "parameters": [
          {
            "name": "itemUId",
            "in": "path",
            "required": true,
            "schema": {
              "type": "string",
              "format": "uuid"
            }
          }
        ],
        "responses": {
          "200": {
            "description": "Success",
            "content": {
              "text/plain": {
                "schema": {
                  "$ref": "#/components/schemas/BooleanAppResult"
                }
              },
              "application/json": {
                "schema": {
                  "$ref": "#/components/schemas/BooleanAppResult"
                }
              },
              "text/json": {
                "schema": {
                  "$ref": "#/components/schemas/BooleanAppResult"
                }
              }
            }
          }
        }
      },
      "get": {
        "tags": [
          "Item"
        ],
        "operationId": "getItem",
        "parameters": [
          {
            "name": "itemUId",
            "in": "path",
            "required": true,
            "schema": {
              "type": "string",
              "format": "uuid"
            }
          }
        ],
        "responses": {
          "200": {
            "description": "Success",
            "content": {
              "text/plain": {
                "schema": {
                  "$ref": "#/components/schemas/ItemReadDtoAppResult"
                }
              },
              "application/json": {
                "schema": {
                  "$ref": "#/components/schemas/ItemReadDtoAppResult"
                }
              },
              "text/json": {
                "schema": {
                  "$ref": "#/components/schemas/ItemReadDtoAppResult"
                }
              }
            }
          }
        }
      }
    },
    "/api/v1/Item/unit-types": {
      "get": {
        "tags": [
          "Item"
        ],
        "operationId": "getItemUniTypes",
        "responses": {
          "200": {
            "description": "Success",
            "content": {
              "text/plain": {
                "schema": {
                  "$ref": "#/components/schemas/ItemUnitDtoIEnumerableAppResult"
                }
              },
              "application/json": {
                "schema": {
                  "$ref": "#/components/schemas/ItemUnitDtoIEnumerableAppResult"
                }
              },
              "text/json": {
                "schema": {
                  "$ref": "#/components/schemas/ItemUnitDtoIEnumerableAppResult"
                }
              }
            }
          }
        }
      }
    },
    "/api/v1/Item/all": {
      "get": {
        "tags": [
          "Item"
        ],
        "operationId": "getItems",
        "parameters": [
          {
            "name": "SearchExpression",
            "in": "query",
            "schema": {
              "type": "string"
            }
          },
          {
            "name": "pageNumber",
            "in": "query",
            "schema": {
              "maximum": 2147483647,
              "minimum": 0,
              "type": "integer",
              "format": "int32"
            }
          },
          {
            "name": "pageSize",
            "in": "query",
            "schema": {
              "maximum": 2147483647,
              "minimum": 0,
              "type": "integer",
              "format": "int32"
            }
          }
        ],
        "responses": {
          "200": {
            "description": "Success",
            "content": {
              "text/plain": {
                "schema": {
                  "$ref": "#/components/schemas/ItemReadDtoIEnumerableAppResult"
                }
              },
              "application/json": {
                "schema": {
                  "$ref": "#/components/schemas/ItemReadDtoIEnumerableAppResult"
                }
              },
              "text/json": {
                "schema": {
                  "$ref": "#/components/schemas/ItemReadDtoIEnumerableAppResult"
                }
              }
            }
          }
        }
      }
    },
    "/api/v1/Item/sync": {
      "get": {
        "tags": [
          "Item"
        ],
        "operationId": "getLatestChanges",
        "parameters": [
          {
            "name": "rowVersion",
            "in": "query",
            "schema": {
              "type": "string"
            }
          }
        ],
        "responses": {
          "200": {
            "description": "Success",
            "content": {
              "text/plain": {
                "schema": {
                  "$ref": "#/components/schemas/ItemReadDtoIEnumerableAppResult"
                }
              },
              "application/json": {
                "schema": {
                  "$ref": "#/components/schemas/ItemReadDtoIEnumerableAppResult"
                }
              },
              "text/json": {
                "schema": {
                  "$ref": "#/components/schemas/ItemReadDtoIEnumerableAppResult"
                }
              }
            }
          }
        }
      }
    },
    "/api/v1/Stores": {
      "post": {
        "tags": [
          "Stores"
        ],
        "operationId": "createStore",
        "requestBody": {
          "content": {
            "application/json": {
              "schema": {
                "$ref": "#/components/schemas/CreateStoreDto"
              }
            },
            "text/json": {
              "schema": {
                "$ref": "#/components/schemas/CreateStoreDto"
              }
            },
            "application/*+json": {
              "schema": {
                "$ref": "#/components/schemas/CreateStoreDto"
              }
            }
          }
        },
        "responses": {
          "200": {
            "description": "Success",
            "content": {
              "text/plain": {
                "schema": {
                  "$ref": "#/components/schemas/GuidAppResult"
                }
              },
              "application/json": {
                "schema": {
                  "$ref": "#/components/schemas/GuidAppResult"
                }
              },
              "text/json": {
                "schema": {
                  "$ref": "#/components/schemas/GuidAppResult"
                }
              }
            }
          }
        }
      }
    },
    "/api/v1/Stores/category": {
      "post": {
        "tags": [
          "Stores"
        ],
        "operationId": "createStoreCategory",
        "requestBody": {
          "content": {
            "application/json": {
              "schema": {
                "$ref": "#/components/schemas/CreateItemCategoryDto"
              }
            },
            "text/json": {
              "schema": {
                "$ref": "#/components/schemas/CreateItemCategoryDto"
              }
            },
            "application/*+json": {
              "schema": {
                "$ref": "#/components/schemas/CreateItemCategoryDto"
              }
            }
          }
        },
        "responses": {
          "200": {
            "description": "Success",
            "content": {
              "text/plain": {
                "schema": {
                  "$ref": "#/components/schemas/GuidAppResult"
                }
              },
              "application/json": {
                "schema": {
                  "$ref": "#/components/schemas/GuidAppResult"
                }
              },
              "text/json": {
                "schema": {
                  "$ref": "#/components/schemas/GuidAppResult"
                }
              }
            }
          }
        }
      }
    },
    "/api/v1/User/authenticate": {
      "post": {
        "tags": [
          "User"
        ],
        "operationId": "authenticate",
        "requestBody": {
          "content": {
            "application/json": {
              "schema": {
                "$ref": "#/components/schemas/LoginRequest"
              }
            },
            "text/json": {
              "schema": {
                "$ref": "#/components/schemas/LoginRequest"
              }
            },
            "application/*+json": {
              "schema": {
                "$ref": "#/components/schemas/LoginRequest"
              }
            }
          }
        },
        "responses": {
          "200": {
            "description": "Success",
            "content": {
              "text/plain": {
                "schema": {
                  "$ref": "#/components/schemas/TokensAppResult"
                }
              },
              "application/json": {
                "schema": {
                  "$ref": "#/components/schemas/TokensAppResult"
                }
              },
              "text/json": {
                "schema": {
                  "$ref": "#/components/schemas/TokensAppResult"
                }
              }
            }
          }
        }
      }
    }
  },
  "components": {
    "schemas": {
      "ApplicationError": {
        "type": "object",
        "properties": {
          "code": {
            "type": "string",
            "nullable": true
          },
          "description": {
            "type": "string",
            "nullable": true
          },
          "descriptionFa": {
            "type": "string",
            "nullable": true,
            "readOnly": true
          },
          "validationErrors": {
            "type": "string",
            "nullable": true
          }
        },
        "additionalProperties": false
      },
      "BooleanAppResult": {
        "type": "object",
        "properties": {
          "Data": {
            "type": "boolean"
          },
          "IsSuccessfull": {
            "type": "boolean"
          },
          "Error": {
            "$ref": "#/components/schemas/ApplicationError"
          }
        },
        "additionalProperties": false
      },
      "CreateItemCategoryDto": {
        "type": "object",
        "properties": {
          "title": {
            "type": "string",
            "nullable": true
          },
          "description": {
            "type": "string",
            "nullable": true
          }
        },
        "additionalProperties": false
      },
      "CreateItemDto": {
        "required": [
          "barcode",
          "categoryUId",
          "config",
          "itemPrice",
          "name",
          "type",
          "unitType"
        ],
        "type": "object",
        "properties": {
          "name": {
            "type": "string"
          },
          "fullName": {
            "type": "string",
            "nullable": true
          },
          "type": {
            "$ref": "#/components/schemas/ItemTypes"
          },
          "unitType": {
            "$ref": "#/components/schemas/ItemUnits"
          },
          "categoryUId": {
            "type": "string",
            "format": "uuid"
          },
          "barcode": {
            "type": "string"
          },
          "brand": {
            "type": "string",
            "nullable": true
          },
          "stock": {
            "type": "integer",
            "format": "int32"
          },
          "config": {
            "$ref": "#/components/schemas/ItemConfigCreateDto"
          },
          "itemPrice": {
            "$ref": "#/components/schemas/ItemPriceCreateDto"
          }
        },
        "additionalProperties": false
      },
      "CreateStoreDto": {
        "type": "object",
        "additionalProperties": false
      },
      "GuidAppResult": {
        "type": "object",
        "properties": {
          "Data": {
            "type": "string",
            "format": "uuid"
          },
          "IsSuccessfull": {
            "type": "boolean"
          },
          "Error": {
            "$ref": "#/components/schemas/ApplicationError"
          }
        },
        "additionalProperties": false
      },
      "ItemCategoryDto": {
        "type": "object",
        "properties": {
          "id": {
            "type": "string",
            "nullable": true
          },
          "title": {
            "type": "string",
            "nullable": true
          },
          "description": {
            "type": "string",
            "nullable": true
          }
        },
        "additionalProperties": false
      },
      "ItemConfigCreateDto": {
        "type": "object",
        "properties": {
          "safetyStock": {
            "type": "integer",
            "format": "int64"
          },
          "purchaseOrderCeiling": {
            "type": "integer",
            "format": "int64"
          },
          "buyOffer": {
            "type": "integer",
            "format": "int32"
          }
        },
        "additionalProperties": false
      },
      "ItemConfigUpdateDto": {
        "type": "object",
        "properties": {
          "uId": {
            "type": "string",
            "format": "uuid"
          },
          "safetyStock": {
            "type": "integer",
            "format": "int64"
          },
          "purchaseOrderCeiling": {
            "type": "integer",
            "format": "int64"
          },
          "buyOffer": {
            "type": "integer",
            "format": "int32"
          }
        },
        "additionalProperties": false
      },
      "ItemPriceCreateDto": {
        "required": [
          "purchasePrice",
          "salePrice"
        ],
        "type": "object",
        "properties": {
          "purchasePrice": {
            "type": "integer",
            "format": "int64"
          },
          "salePrice": {
            "type": "integer",
            "format": "int64"
          }
        },
        "additionalProperties": false
      },
      "ItemPriceUpdateDto": {
        "required": [
          "purchasePrice",
          "salePrice"
        ],
        "type": "object",
        "properties": {
          "uId": {
            "type": "string",
            "format": "uuid"
          },
          "purchasePrice": {
            "type": "integer",
            "format": "int64"
          },
          "salePrice": {
            "type": "integer",
            "format": "int64"
          }
        },
        "additionalProperties": false
      },
      "ItemReadDto": {
        "type": "object",
        "properties": {
          "uId": {
            "type": "string",
            "format": "uuid"
          },
          "name": {
            "type": "string",
            "nullable": true
          },
          "fullName": {
            "type": "string",
            "nullable": true
          },
          "type": {
            "$ref": "#/components/schemas/ItemTypes"
          },
          "unitType": {
            "$ref": "#/components/schemas/ItemUnits"
          },
          "category": {
            "$ref": "#/components/schemas/ItemCategoryDto"
          },
          "status": {
            "$ref": "#/components/schemas/ItemStatuses"
          },
          "barcode": {
            "type": "string",
            "nullable": true
          },
          "brand": {
            "type": "string",
            "nullable": true
          },
          "rowVersion": {
            "type": "string",
            "nullable": true
          },
          "stock": {
            "type": "integer",
            "format": "int32"
          },
          "config": {
            "$ref": "#/components/schemas/ItemConfigUpdateDto"
          },
          "itemPrice": {
            "$ref": "#/components/schemas/ItemPriceUpdateDto"
          }
        },
        "additionalProperties": false
      },
      "ItemReadDtoAppResult": {
        "type": "object",
        "properties": {
          "Data": {
            "$ref": "#/components/schemas/ItemReadDto"
          },
          "IsSuccessfull": {
            "type": "boolean"
          },
          "Error": {
            "$ref": "#/components/schemas/ApplicationError"
          }
        },
        "additionalProperties": false
      },
      "ItemReadDtoIEnumerableAppResult": {
        "type": "object",
        "properties": {
          "Data": {
            "type": "array",
            "items": {
              "$ref": "#/components/schemas/ItemReadDto"
            },
            "nullable": true
          },
          "IsSuccessfull": {
            "type": "boolean"
          },
          "Error": {
            "$ref": "#/components/schemas/ApplicationError"
          }
        },
        "additionalProperties": false
      },
      "ItemStatuses": {
        "enum": [
          "Active",
          "Inactive",
          "Draft"
        ],
        "type": "string"
      },
      "ItemTypes": {
        "enum": [
          "Good",
          "Service"
        ],
        "type": "string"
      },
      "ItemUnitDto": {
        "type": "object",
        "properties": {
          "id": {
            "type": "integer",
            "format": "int32"
          },
          "title": {
            "type": "integer",
            "format": "int32"
          },
          "description": {
            "type": "integer",
            "format": "int32"
          }
        },
        "additionalProperties": false
      },
      "ItemUnitDtoIEnumerableAppResult": {
        "type": "object",
        "properties": {
          "Data": {
            "type": "array",
            "items": {
              "$ref": "#/components/schemas/ItemUnitDto"
            },
            "nullable": true
          },
          "IsSuccessfull": {
            "type": "boolean"
          },
          "Error": {
            "$ref": "#/components/schemas/ApplicationError"
          }
        },
        "additionalProperties": false
      },
      "ItemUnits": {
        "enum": [
          "Weight",
          "Liter",
          "Countable",
          "Box",
          "Twelvepacks",
          "Glasspack"
        ],
        "type": "string"
      },
      "LoginRequest": {
        "required": [
          "password",
          "username"
        ],
        "type": "object",
        "properties": {
          "username": {
            "type": "string"
          },
          "password": {
            "type": "string"
          }
        },
        "additionalProperties": false
      },
      "Tokens": {
        "type": "object",
        "properties": {
          "token": {
            "type": "string",
            "nullable": true
          },
          "refreshToken": {
            "type": "string",
            "nullable": true
          }
        },
        "additionalProperties": false
      },
      "TokensAppResult": {
        "type": "object",
        "properties": {
          "Data": {
            "$ref": "#/components/schemas/Tokens"
          },
          "IsSuccessfull": {
            "type": "boolean"
          },
          "Error": {
            "$ref": "#/components/schemas/ApplicationError"
          }
        },
        "additionalProperties": false
      },
      "UpdateItemDto": {
        "required": [
          "barcode",
          "categoryUId",
          "config",
          "itemPrice",
          "name",
          "type",
          "unitType"
        ],
        "type": "object",
        "properties": {
          "uId": {
            "type": "string",
            "format": "uuid"
          },
          "name": {
            "type": "string"
          },
          "fullName": {
            "type": "string",
            "nullable": true
          },
          "type": {
            "$ref": "#/components/schemas/ItemTypes"
          },
          "unitType": {
            "$ref": "#/components/schemas/ItemUnits"
          },
          "categoryUId": {
            "type": "string",
            "format": "uuid"
          },
          "barcode": {
            "type": "string"
          },
          "brand": {
            "type": "string",
            "nullable": true
          },
          "rowVersion": {
            "type": "string",
            "nullable": true
          },
          "stock": {
            "type": "integer",
            "format": "int32"
          },
          "config": {
            "$ref": "#/components/schemas/ItemConfigUpdateDto"
          },
          "itemPrice": {
            "$ref": "#/components/schemas/ItemPriceUpdateDto"
          }
        },
        "additionalProperties": false
      }
    }
  }
}
''';
