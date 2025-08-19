enum InstallationStepEnum {
  AssignForStaff(id: 1),
  MakeAppointment(id: 2),
  InstallAtCustomerHouse(id: 3),
  SignReport(id: 4),
  AskForHelp(id: 5),
  UpdateMaterial(id: 6),
  UpdateSlidAndDivider(id: 7),
  ReplaceModem(id: 8);

  final int id;

  const InstallationStepEnum({required this.id});
}
