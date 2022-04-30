# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#
Customer.create([
                    {
                        first_name: "James",
                        last_name: "Kumoji",
                        other_names: "Daavi",
                        phone_number: "0233234323",
                        date_of_birth: "1991-02-10",
                        height: "4.5",
                        location: "Accra",
                        comment: "The first customer.",
                        is_active: true
                    },
                    {
                        first_name: "Kate",
                        last_name: "Lawson",
                        other_names: "Efia",
                        phone_number: "0233234323",
                        date_of_birth: "1985-09-22",
                        height: "4.7",
                        location: "Ho",
                        comment: "Out of Accra",
                        is_active: true
                    },
                    {
                        first_name: "Lydia",
                        last_name: "Koomson",
                        phone_number: "0555443344",
                        date_of_birth: "1999-04-14",
                        height: "5.7",
                        location: "Koforidua",
                        comment: "Potential Customer",
                        is_active: true
                    },
                    {
                        first_name: "Lucy",
                        last_name: "Afadze",
                        other_names: "Dame",
                        phone_number: "0249034009",
                        date_of_birth: "1997-12-19",
                        height: "6.0",
                        location: "Sekondi",
                        is_active: true
                    },

                ])

Transaction.create([
                    {
                        transaction_id: Transaction.trans_generator, customer_id: 1,
                        input_amt: 5.50, input_currency: 'EUR',
                        output_amt: 6.70, output_currency: 'USD',
                        is_active: true
                    },
                    {
                        transaction_id: Transaction.trans_generator, customer_id: 1,
                        input_amt: 5.50, input_currency: 'EUR',
                        output_amt: 3.80, output_currency: 'GPD',
                        is_active: true
                    },
                    {
                        transaction_id: Transaction.trans_generator, customer_id: 2,
                        input_amt: 4.40, input_currency: 'USD',
                        output_amt: 7.12, output_currency: 'CAD',
                        is_active: true
                    },
                    {
                        transaction_id: Transaction.trans_generator, customer_id: 3,
                        input_amt: 5.90, input_currency: 'CAD',
                        output_amt: 8.30, output_currency: 'EUR',
                        is_active: true
                    },

                ])
