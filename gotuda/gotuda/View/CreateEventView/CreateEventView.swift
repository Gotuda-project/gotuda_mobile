//
//  CreateEventView.swift
//  gotuda
//
//  Created by Ekaterina Grigorenko on 09.04.2024.
//

import SwiftUI
import ReSwift

struct MainCreateEventView: View {
    @EnvironmentObject var store: AppStore
    
    var body: some View {
        if store.state.showCreateOrder {
            CreateEventView()
        } else {
            Button("Назад") {
                store.dispatch(EventAction.returnToCreate)
            }
        }
    }
}

struct CreateEventView: View {
    @EnvironmentObject var store: AppStore
    @State private var title: String = ""
    @State private var description: String = ""
    @State private var country: String = ""
    @State private var city: String = ""
    @State private var address: String = ""
    @State private var datetime: Date? = Date()
    @State private var maxVisitors: String = ""
    @State private var selectedCategory = ""
    @State private var vibe: String = ""
    @State private var image: UIImage? = nil

    var body: some View {
        if let token = store.state.token {
            CategoryService.shared.getCategories(token: token) { categories in
                store.dispatch(CategoryAction.setCategories(categories))
            }
            print(token)
        }
        return ScrollView {
            Text("Создай свой досуг")
            ImageInput(image: $image)
            
            InputView(
                title: "Название"
                , subtitle: "Введи название мероприятия (не более 50 символов)",
                inputMock: "Прогулка по Москве",
                isRequired: true,
                input: $title
            )
            
            InputView(
                title: "Описание"
                , subtitle: "Опиши мероприятие (не более 200 символов)",
                inputMock: "Прогулка по Москве",
                isRequired: true,
                input: $description
            )
            
            InputView(
                title: "Страна", subtitle: nil,
                inputMock: "Россия",
                isRequired: true,
                input: $country
            )
            
            InputView(
                title: "Город", subtitle: nil,
                inputMock: "Москва",
                isRequired: true,
                input: $city
            )
            
            InputView(
                title: "Адрес", subtitle: nil,
                inputMock: "Красная площадь, 1",
                isRequired: true,
                input: $address
            )
            
            DateInput(
                title: "Время и дата",
                subtitle: "Когда ваше мероприятие будет проходить?",
                placeholder: "07.08.2003",
                birthdate: $datetime,
                dateFormat: "dd.MM.yyyy hh:mm",
                datePickerMode: .dateAndTime,
                isRequired: true
            )
            
            InputView(title: "Максимальное количество участников", subtitle: "Сколько людей может прийти?", inputMock: "20", isRequired: true, input: $maxVisitors)
            Spacer()
            Menu {
                Picker(selection: $selectedCategory, label: Text("Выберите категорию")) {
                    ForEach(store.state.categories) {
                            if let name = $0.shortName {
                                Text(name).tag(name)
                            }
                        }
                    
                }
            } label: {
                Text(selectedCategory.isEmpty ? "Выберите категорию" : selectedCategory)
            }
            Spacer()
            
            InputView(title: "Вайб", subtitle: "Какой вайб у вашего мероприятия", inputMock: "Чилл", isRequired: true, input: $vibe)

            
            
            LargeButton(title: "Создать мероприятие") {
                let formatter = DateFormatter()
                formatter.dateFormat = "dd.MM.yyyy hh:mm"
                let date = formatter.string(from: datetime ?? Date())
                store.dispatch(makeEvent(
                    image: image,
                    token: store.state.token,
                    request: CreateEventRequest(
                        title: title,
                        description: description,
                        address: Address(
                            country: country,
                            city: city,
                            address: address
                        ),
                        eventDatetime: EventDatetime(
                            maxVisitors: Int(maxVisitors) ?? 20,
                            datetime: date
                        ),
                        categories: [selectedCategory],
                        vibes: [vibe],
                        images: nil
                    )
                )
                )
            }
        }
        
    }
}
