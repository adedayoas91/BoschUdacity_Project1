provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "main" {
  name     = "${var.prefix}-resources"
  location = var.location
}

resource "azurerm_virtual_network" "main" {
  name                = "${var.prefix}-network"
  address_space       = ["10.0.0.0/22"]
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name
}


resource "azurerm_subnet" "internal" {
  name                 = "internal"
  resource_group_name  = azurerm_resource_group.main.name
  virtual_network_name = azurerm_virtual_network.main.name
  address_prefixes     = ["10.0.2.0/24"]
}


resource "azurerm_network_interface" "main" {
  name                = "${var.prefix}-nic"
  resource_group_name = azurerm_resource_group.main.name
  location            = azurerm_resource_group.main.location

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.internal.id
    public_ip_address_id = "Dynamic"
  }


resource "azurerm_lb" "main" {
    name                = "TestLoadBalancer"
    location            = azurerm_resource_group.example.location
    resource_group_name = azurerm_resource_group.example.name

    frontend_ip_configuration {
      name                 = "PublicIPAddress"
      public_ip_address_id = azurerm_public_ip.example.id
    }
  }

resource "azurerm_public_ip" "main" {
    name                = "PublicIPForLB"
    location            = azurerm_resource_group.main.location
    resource_group_name = azurerm_resource_group.main.name
    allocation_method   = "Static"
  }

resource "azurerm_availability_set" "main" {
    name                = "example-aset"
    location            = azurerm_resource_group.main.location
    resource_group_name = azurerm_resource_group.main.name
    tags = {
      environment = "Production"
    }
  }


resource "azurerm_managed_disk" "example" {
    name                 = "acctestmd"
    location             = azurerm_resource_group.main.location
    resource_group_name  = azurerm_resource_group.main.name
    storage_account_type = "Standard_LRS"
    create_option        = "Empty"
    disk_size_gb         = "1"

    tags = {
      environment = "staging"
    }
  }

resource "azurerm_network_security_group" {
  name                = "${var.prefix}-resources"
  $ rule1 = New-AzureRmNetworkSecurityRuleConfig -Name rdp-rule -Description “Allow RDP” -Access Allow -Protocol Tcp -Direction Inbound -Priority 100 -SourceAddressPrefix Internet -SourcePortRange * -DestinationAddressPrefix * -DestinationPortRange 3389

  resource_group_name = azurerm_resource_group.main.name
  location            = azurerm_resource_group.main.location
  }
}
  os_disk {
    storage_account_type = "Standard_LRS"
    caching              = "ReadWrite"
  }
}
