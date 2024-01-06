import SwiftUI
import PhotosUI

struct AddHistoryView: View {
    @State var pickerItem: PhotosPickerItem?
    @State var image: Image?
    @State var selectedTansu = 0
    @State var selectedDan = 0
    @State var selectedChae = 0
    @Environment(\.dismiss) var dismiss

    var body: some View {
        VStack(spacing: 36) {
            HStack {
                VStack(alignment: .leading, spacing: 8) {
                    Text("영양 정보를 기록해 주세요!")
                        .font(.custom("EliceDXNeolliOTF-Bd", size: 24))

                    Text("해당 문항에 솔직하게 체크해주세요.")
                        .font(.onePerson(.body4))
                        .foregroundStyle(.gray200)
                }

                Spacer()
            }

            VStack(spacing: 24) {
                VStack(alignment: .leading, spacing: 8) {
                    Text("이미지")
                        .font(.onePerson(.body4))

                    PhotosPicker(selection: $pickerItem) {
                        if image != nil {
                            HStack(spacing: 10) {
                                Image(systemName: "checkmark")
                                    .resizable()
                                    .foregroundStyle(.green500)
                                    .frame(width: 16, height: 12)

                                Text("이미지가 업로드 됐어요.")
                                    .font(.onePerson(.body4))
                                    .foregroundStyle(.green500)

                                Spacer()
                            }
                            .frame(maxWidth: .infinity)
                            .padding(.horizontal, 12)
                            .padding(.vertical, 18)
                            .background {
                                RoundedRectangle(cornerRadius: 16)
                                    .fill(Color.green50)
                                    .stroke(Color.green100)
                            }
                        } else {
                            HStack(spacing: 10) {
                                Image(systemName: "plus")
                                    .foregroundStyle(.blue500)

                                Text("이미지를 업로드 해주세요.")
                                    .font(.onePerson(.body4))
                                    .foregroundStyle(.blue500)

                                Spacer()
                            }
                            .frame(maxWidth: .infinity)
                            .padding(.horizontal, 12)
                            .padding(.vertical, 18)
                            .background {
                                RoundedRectangle(cornerRadius: 16)
                                    .fill(Color.blue50)
                                    .stroke(Color.blue100)
                            }
                        }
                    }
                }

                Divider()
                    .foregroundStyle(.gray100)

                section(title: "탄수화물을 얼마나 섭취했나요? *", subTitle: "쌀, 면, 빵, 구활작물, 과자 등") {
                    HStack(spacing: 8) {
                        selectionMuch(selection: $selectedTansu, index: 0, text: "많이 먹었어요.")
                        selectionMuch(selection: $selectedTansu, index: 1, text: "적당히 먹었어요.")
                        selectionMuch(selection: $selectedTansu, index: 2, text: "조금 먹었어요.")
                    }
                }

                Divider()
                    .foregroundStyle(.gray100)

                section(title: "단백질을 얼마나 섭취했나요? *", subTitle: "닭고기, 소고기, 두부, 콩 등") {
                    HStack(spacing: 8) {
                        selectionMuch(selection: $selectedDan, index: 0, text: "많이 먹었어요.")
                        selectionMuch(selection: $selectedDan, index: 1, text: "적당히 먹었어요.")
                        selectionMuch(selection: $selectedDan, index: 2, text: "조금 먹었어요.")
                    }
                }

                Divider()
                    .foregroundStyle(.gray100)

                section(title: "채소를 얼마나 섭취했나요? *", subTitle: "양배추, 무, 콩나물, 버섯 등") {
                    HStack(spacing: 8) {
                        selectionMuch(selection: $selectedChae, index: 0, text: "많이 먹었어요.")
                        selectionMuch(selection: $selectedChae, index: 1, text: "적당히 먹었어요.")
                        selectionMuch(selection: $selectedChae, index: 2, text: "조금 먹었어요.")
                    }
                }

                Divider()
                    .foregroundStyle(.gray100)

                RoundedRectangle(cornerRadius: 16)
                    .fill(Color.blue500)
                    .frame(height: 58)
                    .overlay {
                        Text("등록하기")
                            .font(.onePerson(.body1))
                            .foregroundStyle(.white)
                    }
                    .buttonWrapper {
                        dismiss()
                    }
            }

            Spacer()
        }
        .padding(.horizontal, 20)
        .onChange(of: pickerItem) {
            Task {
                if let loaded = try? await pickerItem?.loadTransferable(type: Image.self) {
                    image = loaded
                }
            }
        }
    }

    @ViewBuilder
    func section(
        title: String,
        subTitle: String,
        @ViewBuilder selection: () -> some View
    ) -> some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                VStack(alignment: .leading, spacing: 8) {
                    Text(title)
                        .font(.onePerson(.h4))
                        .foregroundStyle(.gray900)

                    Text(subTitle)
                        .font(.onePerson(.body4))
                        .foregroundStyle(.gray400)
                }

                Spacer()
            }

            selection()
        }
    }

    @ViewBuilder
    func selectionMuch(
        selection: Binding<Int>,
        index: Int,
        text: String
    ) -> some View {
        let isSelected = selection.wrappedValue == index
        Text(text)
            .font(.onePerson(.body4))
            .foregroundStyle(isSelected ? .blue500 : .gray500)
            .padding(8)
            .background {
                RoundedRectangle(cornerRadius: 8)
                    .fill(isSelected ? .blue50 : .gray50)
                    .stroke(isSelected ? Color.blue200 : .gray200)
            }
            .buttonWrapper {
                selection.wrappedValue = index
            }
            .frame(maxWidth: .infinity)
    }
}

#Preview {
    AddHistoryView()
}
