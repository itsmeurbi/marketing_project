# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Role.create name: :admin, descr: "Administrador"
Role.create name: :community, descr: "Community Manager"
Role.create name: :generador, descr: "Generador de Contenido"
Role.create name: :designer, descr: "Diseñador"
Role.create name: :rh, descr: "Recursos Humanos"
Role.create name: :sales, descr: "Finanzas"
Role.create name: :agency, descr: "Agencia"
User.create name: "Agencia", birthday: "31/07/1997", email: "lizeth.clfc@gmail.com", password: "123qwe", role_id: 7
