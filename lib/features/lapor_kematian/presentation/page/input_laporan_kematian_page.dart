import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:getasan_app/features/common/constant/style/app_size.dart';
import 'package:getasan_app/features/common/presentation/widget/app_back_button.dart';
import 'package:getasan_app/features/common/presentation/widget/button/primary_button.dart';
import 'package:getasan_app/features/common/presentation/widget/gaps.dart';
import 'package:getasan_app/features/common/presentation/widget/getasan_app_bar.dart';
import 'package:getasan_app/features/common/presentation/widget/input/date_input.dart';
import 'package:getasan_app/features/common/presentation/widget/input/dropdown_input.dart';
import 'package:getasan_app/features/common/presentation/widget/input/text_input.dart';
import 'package:getasan_app/features/lapor_kematian/presentation/controller/laporan_kematian_controller.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class InputLaporanKematianPage extends HookConsumerWidget {
  const InputLaporanKematianPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.read(laporanKematianControllerProvider);

    final useFormKey = useState(GlobalKey<FormState>());

    final useNikCtrl = useTextEditingController();
    final useNamaCtrl = useTextEditingController();
    final useAlamatCtrl = useTextEditingController();
    final useTempatLahirCtrl = useTextEditingController();
    final useTempatMeninggalCtrl = useTextEditingController();
    final usePasanganCtrl = useTextEditingController();
    final useAnakCtrl = useTextEditingController();

    final useTglLahir = useState(DateTime.now());
    final useTglMeninggal = useState(DateTime.now());
    final useStatusKawin = useState<String?>(null);

    return Scaffold(
      appBar: const GetasanAppBar(
        isCenterLogo: true,
      ),
      body: Form(
        key: useFormKey.value,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: AppSize.pagePadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppBackButton(context),
              Gaps.v36,
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      TextInput(
                        controller: useNikCtrl,
                        hint: 'NIK',
                      ),
                      Gaps.v16,
                      TextInput(
                        controller: useNamaCtrl,
                        hint: 'Nama Lengkap',
                      ),
                      Gaps.v16,
                      TextInput(
                        controller: useAlamatCtrl,
                        hint: 'Alamat Rumah',
                      ),
                      Gaps.v16,
                      TextInput(
                        controller: useTempatLahirCtrl,
                        hint: 'Tempat Lahir',
                      ),
                      Gaps.v16,
                      DateInput(
                        hint: '(tgl lahir)',
                        onDateSelected: (dateSelected) {
                          useTglLahir.value = dateSelected;
                        },
                      ),
                      Gaps.v16,
                      TextInput(
                        controller: useTempatMeninggalCtrl,
                        hint: 'Tempat Meninggal',
                      ),
                      Gaps.v16,
                      DateInput(
                        hint: '(tgl meninggal)',
                        onDateSelected: (dateSelected) {
                          useTglMeninggal.value = dateSelected;
                        },
                      ),
                      Gaps.v16,
                      TextInput(
                        controller: usePasanganCtrl,
                        hint: 'Nama Suami/Istri Yang Ditinggalkan',
                        isRequired: false,
                      ),
                      Gaps.v16,
                      TextInput(
                        controller: useAnakCtrl,
                        hint: 'Nama Anak Yang Ditinggalkan',
                        isRequired: false,
                      ),
                      Gaps.v16,
                      DropdownInput<String>(
                        hint: 'Status Kawin',
                        items: const [
                          DropdownMenuItem(
                            value: 'Sudah Menikah',
                            child: Text('Sudah Menikah'),
                          ),
                          DropdownMenuItem(
                            value: 'Belum Menikah',
                            child: Text('Belum Menikah'),
                          ),
                          DropdownMenuItem(
                            value: 'Cerai Hidup',
                            child: Text('Cerai Hidup'),
                          ),
                          DropdownMenuItem(
                            value: 'Carai Mati',
                            child: Text('Cerai Mati'),
                          ),
                        ],
                        onChanged: (selected) {
                          useStatusKawin.value = selected;
                        },
                      ),
                      Gaps.v36,
                      PrimaryButton(
                        label: 'Kirim Formulir',
                        onTap: () async {
                          if (useFormKey.value.currentState!.validate()) {
                            final isSuccess = await controller.createLaporan(
                              nik: useNikCtrl.text,
                              namaLengkap: useNamaCtrl.text,
                              alamat: useAlamatCtrl.text,
                              tempatLahir: useTempatLahirCtrl.text,
                              tanggalLahir: useTglLahir.value,
                              tempatMeninggal: useTempatMeninggalCtrl.text,
                              tanggalMeninggal: useTglMeninggal.value,
                              namaPasanganDitinggal: usePasanganCtrl.text,
                              namaAnakDitinggal: useAnakCtrl.text,
                              statusKawin: useStatusKawin.value ?? "",
                            );

                            if (isSuccess) {
                              useNikCtrl.text = "";
                              useNamaCtrl.text = "";
                              useAlamatCtrl.text = "";
                              useTempatLahirCtrl.text = "";
                              useTempatMeninggalCtrl.text = "";
                              usePasanganCtrl.text = "";
                              useAnakCtrl.text = "";
                              useStatusKawin.value = "";
                              useTglMeninggal.value = DateTime.now();
                              useTglLahir.value = DateTime.now();
                            }
                          }
                        },
                      ),
                      Gaps.v36,
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
